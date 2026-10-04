# IMSH Patient Portal — codebase guide

This document explains the **imsh** Flutter app (`package: imsh`) so a new reader can follow a screen, a network call, and a piece of state from the entry point to the hospital API.

The app is the **patient** client for the IMSH hospital system. Staff use a separate app (helty). Patients sign in with a hospital patient ID and date of birth, then read and act on their own records: appointments, labs, radiology, medications, bills, theatre schedules, cycle tracking, emergency requests, and linked family members.

Targets: **Android**, **iOS**, **Web**, and desktop (Windows video playback is registered explicitly). Version in `pubspec.yaml` is `0.1.0+5`.

Hospital time is **Africa/Lagos** (`AppTimezone`).

---

## 1. How to run it

1. Copy `.env.example` to `.env`.
2. Set `API_BASE_URL`. Typical values:
   - Android emulator: `http://10.0.2.2:3000`
   - iOS simulator, web, desktop: `http://localhost:3000`
   - Production candidate already in code: `https://api.imsh.ng`
3. Install and generate:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

The backend must answer `GET /server-time`. The app probes several base URLs at startup and keeps the fastest one. If the device clock differs from the server by more than **2 minutes**, the app stays on a blocking screen until the clock is corrected.

Code generation produces files you should not edit by hand:

| Generator | Output |
|-----------|--------|
| `envied` | `lib/src/config/env.g.dart` from `.env` |
| `auto_route` | `lib/app_router.gr.dart` from `@RoutePage` screens |
| `freezed` + `json_serializable` | `*.freezed.dart` and `*.g.dart` next to models |

`flutter analyze` uses `analysis_options.yaml` (`flutter_lints`, single quotes, explicit return types, no `print`).

Launcher icons: `dart run flutter_launcher_icons` from `assets/imsh.png`.

---

## 2. The shape of the code

Every feature follows the same path:

```
Screen (features/)
    watches a Riverpod provider (providers/)
        calls a service (services/)
            uses the shared Dio client (ApiService)
                JSON becomes a model (models/)
```

```
lib/
  main.dart                 App start, Firebase, theme, session restore
  firebase_options.dart     Generated Firebase config
  app_router.dart           Route table (you edit this)
  app_router.gr.dart        Generated route classes
  src/
    config/                 .env and API candidate URLs
    core/                   HTTP interceptors, errors, theme, layout, token storage
    features/               Screens and feature widgets, one folder per area
    models/                 DTOs (mostly freezed)
    providers/              Riverpod state
    services/               One class per API area
    shared/widgets/         Reusable UI
    widgets/                App-wide overlays (clock gate, offline, Android update)
    helper/                 Dates, currency, Lagos timezone
```

Platform folders (`android/`, `ios/`, `web/`, `windows/`, `linux/`, `macos/`) are the Flutter shells. Patient business logic lives under `lib/`.

`docs/stitch-prompts/` is a design-prompt pack for screen mockups. It is not runtime code.

---

## 3. What happens when the app starts

`main()` in `lib/main.dart` does this, in order:

1. `WidgetsFlutterBinding.ensureInitialized()`.
2. On Windows, registers `video_player_win` so the login video can play.
3. On Android, turns on the system photo picker for `image_picker`.
4. `Firebase.initializeApp` with `DefaultFirebaseOptions.currentPlatform`.
5. On mobile, registers `firebaseMessagingBackgroundHandler` for background pushes.
6. `AppTimezone.initialize()` loads the `Africa/Lagos` timezone database.
7. Reads the saved light/dark/system theme from `SharedPreferences`.
8. Runs `ProviderScope` with that theme override, wrapped in `ClockSyncGate`, then `ImshApp`.

### Clock gate

`ClockSyncGate` (`lib/src/widgets/clock_sync_gate.dart`) runs **before** the router:

1. `ApiEndpointSelector` probes every URL in `kApiCandidateBaseUrls` with `GET /server-time` (5 second timeout each).
2. The fastest success becomes `ApiService().setBaseUrl(...)`.
3. If `|device time − server time| > 120000 ms`, the user sees a clock-mismatch screen and the rest of the app does not mount.
4. On network failure, an error panel with retry is shown.
5. On success, `ImshApp` builds.

Candidate URLs (`lib/src/config/api_config.dart`), in order, de-duplicated:

- `API_BASE_URL` from `.env` (default `http://localhost:3000`)
- `https://api.imsh.ng`
- `http://192.168.2.120:3000`
- `http://192.168.1.180:3000`
- `http://192.168.2.121:3000`

Dio timeouts for normal calls are 15 seconds connect, send, and receive.

### After the gate

`ImshApp` is a `MaterialApp.router`:

- Themes: `AppTheme.lightTheme` / `AppTheme.darkTheme`, mode from `themeModeProvider`.
- Router: `NavigationService.router` (`AppRouter`).
- On mobile the **initial route is `/splash`**. On web it is `/login` (`initialSplash: !kIsWeb` in `NavigationService`).
- Builder wraps every page in three overlays, outside in:
  1. `AppNotificationHost` — in-app notification chrome
  2. `OfflineBanner` — watches `connectivity_plus`
  3. `ImshAndroidUpdateLayer` — Android-only APK update chip (stub on other platforms)

On the first frame, `ImshApp` calls `patientAuthProvider.restoreSession()` and wires two global hooks:

- `AuthSessionHooks.onDeviceRevoked` — clear family view and wipe local auth.
- `AuthSessionHooks.onDevicePendingApproval` — mark the current device pending.
- FCM callbacks for device approval and family appointment / medication pushes.

Splash then decides the next screen from that restored session (see Authentication).

---

## 4. HTTP client

`ApiService` is a singleton Dio client (`lib/src/services/api_service.dart`).

Interceptors, in order:

| Interceptor | Role |
|-------------|------|
| `AuthInterceptor` | Adds `Authorization: Bearer <jwt>` from secure storage when a token exists. |
| `ErrorInterceptor` | Maps Dio errors to `AppException`. Handles session codes. |
| `LogInterceptor` | Debug builds only. |
| `DecimalNormalizeInterceptor` | Normalizes decimal JSON the API sometimes sends as strings. |

`ErrorInterceptor` behavior that affects navigation:

- **401** on any path except `/patient-auth/login`: clear the JWT, call `onDeviceRevoked`, replace the stack with `LoginRoute`. Login 401s stay on the login form.
- **403** with body code `DEVICE_PENDING_APPROVAL`: call `onDevicePendingApproval` and replace the stack with `DevicePendingRoute`.
- **403** with code `DEVICE_REVOKED` is modeled on `UnauthorizedException` only when the status is 401 (`isDeviceRevoked`). Pending approval is the 403 path.

Exception types (`lib/src/core/errors/app_exception.dart`): `NetworkException`, `TimeoutException`, `ServerException`, `ConflictException` (409), `UnauthorizedException` (401), `ForbiddenException` (403), `NotFoundException` (404), `ValidationException` (400/422), `UnknownException`.

UI copy goes through `userFacingErrorMessage` so raw exceptions are not shown as-is.

Money fields use `ApiAmountConverter` / `api_decimal.dart` so naira amounts survive string-or-number JSON. Media URLs are resolved with `api_media_url.dart` against the chosen base URL.

---

## 5. Authentication and devices

There is no password. Login is hospital identity plus date of birth, plus a stable device key.

### Login request

`PatientAuthService.login` posts to `POST /patient-auth/login`:

```json
{
  "patientId": "trimmed id",
  "dob": "YYYY-MM-DD",
  "deviceKey": "uuid stored on this install",
  "platform": "android | ios | web | …",
  "deviceLabel": "human-readable device name",
  "fcmToken": "optional, if already known"
}
```

Response (`PatientLoginResponse`): `accessToken`, `patient`, `device`. The JWT is saved with `flutter_secure_storage` under key `access_token`.

`deviceKey` is a UUID created once per install (`TokenStorage.getOrCreateDeviceKey`). Logout deletes the JWT only. The device key and FCM token stay so the same phone is recognized next time.

### Session restore

`restoreSession`:

1. If no token, stop.
2. `GET /patient-auth/me` and `GET /patient/devices/status`.
3. On success, store patient + device and register FCM.
4. On failure, unregister FCM, call logout, reset auth state.

### Who may enter the shell

`PatientAuthState`:

| Getter | Meaning |
|--------|---------|
| `isAuthenticated` | A `Patient` is in memory. |
| `isDeviceApproved` | Device status is `APPROVED`, or the patient ID is exempt. |
| `isDevicePending` | Status is `PENDING` and the account is not exempt. |
| `canAccessApp` | Authenticated and device approved. |

Device statuses: `PENDING`, `APPROVED`, `REVOKED`.

QA / demo exemption: patient ID `Q4CMEZM8` skips device approval (`lib/src/core/constants/test_accounts.dart`).

### Screens

| Route | Screen | What it does |
|-------|--------|----------------|
| `/splash` | `SplashScreen` | Branding animation (skipped on web). After restore, goes to shell, device-pending, or login. Minimum splash time on mobile is 2.5s unless reduced motion is on. |
| `/login` | `LoginScreen` | Patient ID + date of birth over a looping `assets/login.mp4`. Draft fields live in `loginDraftProvider`. On success, shell if approved, otherwise device-pending. |
| `/session-expired` | `SessionExpiredScreen` | Defined on the login file. Explains that the session ended. |
| `/device-pending` | `DevicePendingScreen` | Waiting room until staff approve this device. A `DEVICE_APPROVED` push calls `refreshDeviceStatus` and replaces the stack with the shell. |

`AuthGuard` protects only the shell route `/`. It checks that a token exists. It does **not** check device approval; splash and the 403 interceptor do that. Other feature routes (`/lab-results`, `/medications`, …) are not listed with `AuthGuard`. They still send the bearer token. A 401 sends the user to login.

Logout (`LogoutTextButton` / `logout()`): unregister FCM locally, `POST /patient-auth/logout`, clear the JWT, reset `PatientAuthState`.

### Secure storage keys

| Key | Survives logout |
|-----|-----------------|
| `access_token` | No |
| `fcm_device_token` | Yes, until logout deletes it explicitly |
| `device_key` | Yes |

---

## 6. Navigation

Routes are declared in `lib/app_router.dart`. Screen classes use `@RoutePage()`. Generated names drop `Screen`/`Page` and add `Route` (`LoginScreen` → `LoginRoute`).

Push with `context.router.push(...)` or `NavigationService.router` when there is no `BuildContext` (FCM, interceptors).

### Shell (the signed-in app)

`PatientShellScreen` is an `AutoTabsScaffold` with a bottom `NavigationBar`:

| Index | Tab | Widget | Label |
|------:|-----|--------|-------|
| 0 | `HomeTabScreen` | `HomeBody` | Home |
| 1 | `RecordsTabScreen` | `MedicalRecordsBody` | Records |
| 2 | `BookingTabScreen` | `AppointmentsBody` | Booking |
| 3 | `BillsTabScreen` | `BillingBody` | Billing |
| 4 | `AccountTabScreen` | `ProfileBody` | Account |

Home “Pay bill” and “Self check-in” switch to tabs 3 and 2. They do not push a new route.

### Full route table

| Path | Screen |
|------|--------|
| `/splash` | Splash |
| `/login` | Login |
| `/session-expired` | Session expired |
| `/device-pending` | Device pending approval |
| `/` | Patient shell (guarded) |
| `/appointments` | Appointment list (also embedded as the Booking tab) |
| `/appointments/:id` | Appointment detail |
| `/appointments/book` | Book / request a visit |
| `/theatre` | Theatre schedules |
| `/theatre/:id` | Theatre schedule detail |
| `/health/campaigns` | Campaign list |
| `/health/campaigns/:id` | Campaign detail |
| `/health/news` | News list |
| `/health/news/:id` | News detail |
| `/trends/vitals` | Vitals trend chart |
| `/trends/lab` | Lab analyte trend chart |
| `/lab-results` | Lab results |
| `/lab-results/:id` | Lab result detail |
| `/radiology` | Radiology reports |
| `/radiology/:id` | Radiology detail |
| `/medical-records` | Medical records (also the Records tab) |
| `/medical-records/:id` | Encounter detail |
| `/medications` | Medications |
| `/medications/history` | Prescription history |
| `/bills` | Billing (also the Billing tab) |
| `/bills/:id` | Invoice detail |
| `/receipts/:id` | Receipt viewer (`:id` is a payment id) |
| `/feedback` | Feedback list |
| `/feedback/new` | Create feedback |
| `/feedback/:id` | Feedback detail |
| `/feedback/:id/edit` | Edit feedback |
| `/emergency` | Emergency requests |
| `/emergency/new` | Create request (signed in) |
| `/emergency/guest` | Guest emergency form (no login) |
| `/emergency/guest/submitted` | Guest confirmation |
| `/emergency/:id` | Emergency request detail |
| `/notifications` | Placeholder screen |
| `/family` | Linked family members |
| `/devices` | Signed-in devices |
| `/health-card` | QR health card |
| `/cycle` | Cycle tracker |
| `/profile` | Profile |
| `/profile/edit` | Edit profile |

Home quick actions open: Emergency, self check-in (Booking tab), request visit, health card, medications, lab results, radiology, pay bill (Billing tab), cycle, family, notifications, feedback.

Account “Hospital links” open: cycle, health card, family, devices, feedback, and on Android a manual update check.

---

## 7. Family viewing

A signed-in patient can switch the app into “viewing a dependent” mode.

`familyViewProvider` holds an optional `FamilyMember`. `forPatientId` is that member’s `id`, or null when viewing yourself.

`watchForPatientId(ref)` is what list/detail providers pass as the query parameter `forPatientId`. The backend then returns that person’s data instead of the guardian’s.

Used by: home dashboard, appointments, medications (including mark-taken and refills), labs, radiology, medical records, vitals/lab trends, theatre schedules.

`FamilySubjectBanner` shows who is selected. Clearing it (logout, device revoked) calls `familyViewProvider.notifier.clear()`.

Push notifications can select a family member before opening the screen:

- `APPOINTMENT` with `forPatientId` / `isFamily` → `selectById`, then appointment detail.
- `MEDICATION` or `MEDICATION_MISSED` with `patientId` → `selectById` unless that id is the signed-in patient, then medications.

The family **screen** only lists members (`GET /patient/family`). The client does not link or unlink dependents.

---

## 8. Push notifications (FCM)

`FcmPushService` runs on mobile only (`kIsWeb` returns immediately).

After a successful login or session restore it:

1. Initializes `flutter_local_notifications` (Android channel `imsh_high_importance`, name “IMSH Alerts”).
2. Requests alert / badge / sound permission.
3. `PATCH /patient/devices/current/fcm-token` with the token and platform.
4. Saves the token locally.

Foreground messages are shown as local notifications. Taps and notification-opens call `_navigateFromData` using `data['type']`:

| `type` | Navigation |
|--------|------------|
| `DEVICE_APPROVED` | Refresh device status and open the shell. |
| `EMERGENCY_REQUEST` | Detail if `emergencyRequestId` is set, else the list. |
| `MEDICATION`, `MEDICATION_MISSED` | Optionally switch family subject, then medications. |
| `APPOINTMENT` | Optionally switch family subject, then appointment detail. Missing id opens notifications. |
| anything else | Notifications route. |

The in-app **Notifications screen is a placeholder**. `NotificationService` can `GET /patient/notifications` and `PATCH /patient/notifications/:id/read`, but no screen calls it yet.

`socket_io_client` is in `pubspec.yaml` and is not imported anywhere under `lib/`.

---

## 9. State management

Riverpod 3. Providers are created at the top level of `lib/src/providers/`.

Patterns used:

- `Provider` — services and derived values.
- `StateNotifierProvider` / `Notifier` — auth, theme, family subject, booking wizard, dose actions.
- `FutureProvider.autoDispose` — one-shot loads (dashboard, detail). They refetch when watched again after disposal, and they re-run when `familyViewProvider` changes because they call `watchForPatientId`.
- `FutureProvider.autoDispose.family` — detail by id.
- `PagingController` from `infinite_scroll_pagination` — long lists (labs, radiology, encounters, invoices, payments, prescription history).

Service providers all live in `service_providers.dart`. Screens should `ref.watch` those, not construct Dio themselves. Services still accept an optional `Dio` for tests and otherwise use `ApiService().dio`.

### Provider index

| Provider | File | Holds |
|----------|------|--------|
| `patientAuthProvider` | `auth_provider.dart` | Patient, device, loading, error |
| `currentPatientProvider` | `auth_provider.dart` | `Patient?` |
| `fcmPushServiceProvider` | `auth_provider.dart` | Push service |
| `themeModeProvider` | `theme_mode_provider.dart` | `ThemeMode`, persisted |
| `loginDraftProvider` | `login_clock_provider.dart` | In-progress login fields |
| `connectivityProvider` / `isOfflineProvider` | `connectivity_provider.dart` | Network status |
| `familyViewProvider` | `family_provider.dart` | Selected dependent |
| `familyMembersProvider` | `family_provider.dart` | Family list |
| `homeDashboardProvider` | `home_provider.dart` | Combined home payload |
| `profileProvider` | `profile_provider.dart` | `GET /patient/profile` |
| `appointmentsDashboardProvider` | `appointments_provider.dart` | Booking tab data |
| `appointmentFilterProvider` | `appointments_provider.dart` | Upcoming / past / cancelled chip |
| `appointmentDetailProvider` | `appointments_provider.dart` | One appointment |
| `appointmentSpecialtiesProvider` | `appointments_provider.dart` | Booking specialties |
| `bookingWizardProvider` | `appointments_provider.dart` | Multi-step booking |
| `bookAppointmentProvider` | `appointments_provider.dart` | Create mutation |
| `cancelAppointmentProvider` | `appointments_provider.dart` | Cancel mutation |
| `medicationsDashboardProvider` | `medications_provider.dart` | Today’s doses and prescriptions |
| `medicationsViewModeProvider` | `medications_provider.dart` | Calendar vs by-drug |
| `medicationCalendarProvider` | `medications_provider.dart` | Month calendar |
| `prescriptionDosesProvider` | `medications_provider.dart` | Doses for one prescription |
| `markDoseTakenProvider` | `medications_provider.dart` | Mark taken |
| `scheduleConfirmProvider` | `medications_provider.dart` | Confirm or set schedule start |
| `requestRefillProvider` | `medications_provider.dart` | Refill request |
| `pendingDoseMarkProvider` | `pending_dose_mark_provider.dart` | Optimistic dose ids |
| `doseStreakProvider` | `dose_streak_provider.dart` | Streak derived from dashboard |
| `labResultsPagingControllerProvider` | `lab_results_provider.dart` | Paged labs |
| `labResultFilterProvider` | `lab_results_provider.dart` | Filter chip |
| `labResultDetailProvider` | `lab_results_provider.dart` | One report |
| `radiologyReportsPagingControllerProvider` | `radiology_reports_provider.dart` | Paged reports |
| `radiologyReportFilterProvider` | `radiology_reports_provider.dart` | Filter |
| `radiologyReportDetailProvider` | `radiology_reports_provider.dart` | One report |
| `medicalRecordsDashboardProvider` | `medical_records_provider.dart` | Records tab |
| `medicalRecordsPagingControllerProvider` | `medical_records_provider.dart` | Paged encounters |
| `encounterDetailProvider` | `medical_records_provider.dart` | One encounter |
| `billingDashboardProvider` | `billing_provider.dart` | Summary + lists |
| `invoiceDetailProvider` | `billing_provider.dart` | One invoice |
| `receiptProvider` | `billing_provider.dart` | One receipt |
| `cycleSummaryProvider` / `cycleCalendarProvider` | `cycle_provider.dart` | Cycle data |
| `healthCardProvider` | `health_card_provider.dart` | QR card |
| `theatreSchedulesProvider` | `theatre_provider.dart` | Theatre list |
| `healthCampaignsProvider` / `healthNewsProvider` | `health_content_provider.dart` | CMS-style content |
| `feedbackListProvider` and mutations | `feedback_provider.dart` | Suggestions and complaints |
| `emergencyListProvider` and mutations | `emergency_provider.dart` | Emergency requests |
| `vitalsTrendProvider` / `labAnalyteTrendProvider` | `trends_provider.dart` | Charts |

Invalidate a `FutureProvider` with `ref.invalidate(...)` after a mutation (dose taken, profile photo, booking) so the screen reloads.

---

## 10. API catalog

All patient routes expect the bearer token except `GET /server-time`, `POST /patient-auth/login`, and `POST /public/emergency-requests`.

Optional query `forPatientId` is listed as “family” when the service sends it.

### Auth and profile

| Method | Path | Service |
|--------|------|---------|
| GET | `/server-time` | `ServerTimeService` |
| POST | `/patient-auth/login` | `PatientAuthService` |
| GET | `/patient-auth/me` | `PatientAuthService` |
| POST | `/patient-auth/logout` | `PatientAuthService` |
| GET | `/patient/profile` | `ProfileService` |
| PUT | `/patient/profile` | `ProfileService` |
| POST | `/patient/profile/photo` | multipart field `photo` |
| DELETE | `/patient/profile/photo` | `ProfileService` |

### Devices

| Method | Path |
|--------|------|
| GET | `/patient/devices/status` |
| GET | `/patient/devices` |
| PATCH | `/patient/devices/current/fcm-token` |
| DELETE | `/patient/devices/:id` |

### Appointments

| Method | Path | Notes |
|--------|------|-------|
| GET | `/patient/appointments/dashboard` | family, filter |
| GET | `/patient/appointments` | family, paging |
| GET | `/patient/appointments/:id` | family |
| POST | `/patient/appointments` | create |
| PATCH | `/patient/appointments/:id` | update / reschedule |
| DELETE | `/patient/appointments/:id` | cancel |
| GET | `/patient/appointments/specialties` | |
| GET | `/patient/appointments/doctors` | |
| GET | `/patient/appointments/availability` | |

### Clinical records

| Method | Path | Notes |
|--------|------|-------|
| GET | `/patient/lab-reports` | family, paging, filter |
| GET | `/patient/lab-reports/:id` | family |
| GET | `/patient/radiology-reports` | family |
| GET | `/patient/radiology-reports/:id` | family |
| GET | `/patient/radiology-reports/:reportId/images/:imageId/file` | raw bytes |
| GET | `/patient/medical-records` | family |
| GET | `/patient/medical-records/:id` | family |
| GET | `/patient/medical-records/dashboard` | family |
| GET | `/patient/medical-records/diagnoses` | family |
| GET | `/patient/medical-records/vitals-trend` | family |

### Medications

| Method | Path |
|--------|------|
| GET | `/patient/medications/dashboard` |
| GET | `/patient/medications/calendar` |
| GET | `/patient/medications/prescriptions/:id/doses` |
| POST | `/patient/medications/doses/:doseId/taken` |
| DELETE | `/patient/medications/doses/:doseId/taken` |
| PATCH | `/patient/medications/prescriptions/:id/schedule-start` |
| POST | `/patient/medications/prescriptions/:id/confirm-schedule` |
| GET | `/patient/medications/prescriptions` |
| POST | `/patient/medications/prescriptions/:id/refill-request` |

All of these accept `forPatientId`.

### Billing, cycle, theatre, content

| Method | Path |
|--------|------|
| GET | `/patient/billing/summary` |
| GET | `/patient/invoices` |
| GET | `/patient/invoices/:id` |
| GET | `/patient/payments` |
| GET | `/patient/receipts/:paymentId` |
| GET | `/patient/cycle/summary` |
| GET | `/patient/cycle/calendar` |
| PUT | `/patient/cycle/settings` |
| POST | `/patient/cycle/periods` |
| PATCH | `/patient/cycle/periods/:id` |
| DELETE | `/patient/cycle/periods/:id` |
| GET | `/patient/theatre/schedules` |
| GET | `/patient/health/campaigns` |
| GET | `/patient/health/news` |
| GET | `/patient/health-card` |
| GET | `/patient/family` |

### Feedback, emergency, notifications

| Method | Path |
|--------|------|
| GET | `/patient/feedback` |
| GET | `/patient/feedback/:id` |
| POST | `/patient/feedback` |
| PATCH | `/patient/feedback/:id` |
| DELETE | `/patient/feedback/:id` | closes the item |
| GET | `/patient/emergency-requests` |
| GET | `/patient/emergency-requests/:id` |
| POST | `/patient/emergency-requests` | multipart: text, location, photo, audio |
| POST | `/public/emergency-requests` | same, no auth (guest) |
| PATCH | `/patient/emergency-requests/:id/cancel` |
| (media) | `/patient/emergency-requests/:id/media/:kind` |
| GET | `/patient/notifications` | service only; screen is a placeholder |
| PATCH | `/patient/notifications/:id/read` | service only |

Android update checks are **not** patient-API calls. They use a separate Dio client aimed at `{api origin}/imsh-android/` (`version` and `download/latest`).

---

## 11. Features, one by one

### Home — `lib/src/features/home/`

`homeDashboardProvider` loads, in parallel, the appointments dashboard, medication dashboard, and medical-records dashboard for the current subject (self or family).

`HomeBody` is a scroll view with:

- `ImshSliverAppBar` and `FamilySubjectBanner`
- Greeting header (`home_header.dart`, `timeBasedGreeting`)
- KPI strip
- Upcoming appointment
- Medications snippet
- Lab snippet, billing snippet, cycle snippet, vitals row
- Campaigns and news (first two of each)
- Quick actions as a grid, or a full-height rail when width ≥ 1100

Pull to refresh invalidates home, campaigns, and news.

### Appointments — `lib/src/features/appointments/`

Booking tab uses `AppointmentsBody`: filters (`AppointmentFilterTab`), next appointment, list, consultation history.

`BookAppointmentScreen` is a wizard (`bookingWizardProvider`): specialty → doctor → availability slot → confirm. Create goes to `POST /patient/appointments`. Cancel uses DELETE. Reschedule from home uses PATCH.

Statuses, visit types, and consultation results are enums on `appointment_model.dart`.

### Medical records — `lib/src/features/medical_records/`

Records tab (`MedicalRecordsBody`) shows a dashboard: KPIs, allergies, profile metrics, diagnoses, immunizations, recent labs, and a paged encounter list. Wide layouts use a side rail.

`EncounterDetailScreen` shows SOAP notes, vitals, diagnoses, and prescriptions for one visit. Diagnoses can be exported to PDF (`pdf/diagnoses_pdf.dart`).

Encounter types and statuses are enums on `medical_record_model.dart`. Dashboard-only shapes that are not freezed live in `medical_records_dashboard_model.dart`.

### Lab results — `lib/src/features/lab_results/`

Paged list with filter chips (`LabResultFilterChip`). Detail shows panels, line values, abnormal flags, and a PDF action when the API provides one.

### Radiology — `lib/src/features/radiology/`

Paged reports with modality, status, and severity filters. Detail includes findings and an image carousel. Image bytes come from the authenticated file endpoint. A PDF can be built locally (`pdf/radiology_report_pdf.dart`) and opened with `radiology_pdf_download.dart`.

### Medications — `lib/src/features/medications/`

Dashboard: streak header, next-dose carousel, today’s schedule, active prescriptions.

Two view modes (`MedicationsViewMode`): calendar (`table_calendar`) and by-drug.

Dose buttons (`duolingo_dose_button.dart`, `dose_actions.dart`) mark a dose taken or undo it. `pendingDoseMarkProvider` keeps the tap feeling instant while the POST/DELETE is in flight. `doseStreakProvider` reads streak numbers from the dashboard response.

Patients can confirm a schedule start time and request a refill. History is a separate paged screen.

### Billing — `lib/src/features/billing/`

Summary (outstanding, next due), unpaid invoices (paged), payment history (paged), support card. Invoice detail shows admission info and charge breakdown by category. Receipt route loads `GET /patient/receipts/:paymentId`.

Amounts are strings converted by `ApiAmountConverter`, formatted with `currency_formatter.dart`.

### Profile and account — `lib/src/features/profile/`

Account tab shows identity, contact, HMO, theme switch (`theme_mode_provider`), and the hospital-links list. Edit profile PUTs allowed contact fields. Avatar upload uses `image_picker` and `image_cropper`, then `POST /patient/profile/photo`.

### Family — `lib/src/features/family/`

Lists `FamilyMember` rows and selects one into `familyViewProvider`. Read-only.

### Devices — `lib/src/features/devices/`

Lists devices from `GET /patient/devices` and can delete one. The current device is flagged `isCurrent`.

### Health card — `lib/src/features/health_card/`

`HealthCardData` is a hand-written parser (not freezed) because the payload keys vary. It renders a pass-style card and a QR (`qr_flutter`) from `qrPayload`.

### Cycle — `lib/src/features/cycle/`

Summary (predictions, settings) and a calendar. Day sheet logs or edits a period. Settings sheet updates cycle length and period length. Flow amount is `PatientCycleFlow`.

### Theatre — `lib/src/features/theatre/`

Lists upcoming operations for the subject: room, staff, schedule. Detail is selected from the loaded list (`theatreScheduleDetailProvider`), not a second GET.

### Health content — `lib/src/features/health/`

Campaigns and news from `/patient/health/campaigns` and `/patient/health/news`. Detail screens find the item in the list response.

### Trends — `lib/src/features/trends/`

`fl_chart` line charts. Vitals come from `/patient/medical-records/vitals-trend`. Lab trends reuse lab report history and let the user pick an analyte (`labAnalyteOptionsProvider`).

### Feedback — `lib/src/features/feedback/`

List filtered by kind (`suggestion` / complaint enums) and status. Create, edit, and close (DELETE). Staff replies are on `PatientFeedback`.

### Emergency — `lib/src/features/emergency/`

Signed-in list, create, detail, cancel.

Create collects a description, optional GPS (`geolocator` + `permission_handler`), optional photo (`image_picker`), and optional voice note (`record`). The service posts multipart to `/patient/emergency-requests`.

Guest flow (`/emergency/guest`) posts to `/public/emergency-requests` without a token, then shows a submitted screen. Guest routes are outside the shell so they work before login.

### Notifications

`NotificationsScreen` is `FeaturePlaceholderScreen`. Pushes still deep-link elsewhere. Wiring this screen means calling `NotificationService` and replacing the placeholder.

### Splash branding

`SplashBranding` shows the IMSH mark and a “powered by Vessel” footer (`assets/vessellogo.png`).

---

## 12. Models

Most models are `@freezed` classes with `fromJson`. Generated files sit beside them. Edit the hand-written `.dart` file, then run `build_runner`.

Hand-written (no freezed) models:

- `server_time_model.dart` — `ServerTimePayload`
- `health_card_model.dart` — `HealthCardData`
- `theatre_schedule_model.dart` — schedules, rooms, staff
- `medical_records_dashboard_model.dart` — dashboard aggregates

Important enums (JSON values are the `@JsonValue` strings, usually SCREAMING_SNAKE from the API):

| Area | Enums |
|------|--------|
| Device | `PatientDeviceStatus` |
| Appointment | `AppointmentStatus`, `AppointmentVisitType`, `AppointmentFilterTab`, `ConsultationResultStatus` |
| Medication | `MedicationDoseStatus`, `MedicationTimeOfDay`, `PrescriptionSupplyStatus`, `PrescriptionHistoryStatus` |
| Lab | `LabOrderStatus`, `LabSummaryStatus`, `LabAbnormalFlag` |
| Radiology | `RadiologyReportStatus`, `RadiologyModality`, `RadiologyReportSeverity` |
| Encounter | `EncounterType`, `EncounterStatus` |
| Billing | `InvoiceStatus`, `BillType`, `ChargeCategory`, `PaymentMethod` |
| Feedback | `PatientFeedbackKind`, `PatientFeedbackStatus` |
| Emergency | `EmergencyRequestStatus` |
| Cycle | `PatientCycleFlow` |

`Patient` identity fields: `id` (internal), `patientId` (hospital code used at login), `cardNo`, name parts, `dob`, `gender`, contact, `hmo`, `avatarUrl`. Display helpers: `displayFirstName`, `initials`.

---

## 13. UI system

Visual language is clinical and compact, shared with the helty staff app’s patterns.

Theme (`lib/src/core/theme/`):

- `AppTheme` builds light and dark `ThemeData`.
- Typeface: Inter via `google_fonts`.
- `AppDesignTokens` holds the `ColorScheme`, radii, and spacing.
- `ImshThemeExtension` adds app-specific colors on `Theme`.
- `ImshAccentColors` — blue `#2563EB`, teal `#0D9488`, purple `#7C3AED`, pink `#DB2777`, indigo `#4F46E5`, green `#16A34A`, amber `#EA580C`.
- `status_badge_colors.dart` maps clinical statuses to colors.
- `context_extensions.dart` shortens `Theme.of(context)` access.

Reusable widgets (`lib/src/shared/widgets/`):

| Widget | Use |
|--------|-----|
| `ImshSurfaceCard` | Standard card surface |
| `ImshSolidIcon` | Opaque rounded square, white glyph, one distinct color per control |
| `ImshPageHeader` / `ImshSliverAppBar` / `ImshAppBar` | Page chrome |
| `ImshSectionHeader` | Section title |
| `ImshKpiTile` | Small metric card |
| `ImshFilterRow` | Search + filters on one row |
| `ImshEllipsisText` / `ImshEllipsisChip` | One line, ellipsis, tooltip |
| `ImshSemanticBadge` | Status pill |
| `ImshEmptyState` / `ImshErrorPanel` | Empty and error |
| `FamilySubjectBanner` | “Viewing …” bar |
| `PatientAvatar` | Photo or initials |
| `OfflineBanner` | Connectivity strip |
| `AdaptiveDatePicker` | Platform date picker |
| `ThemeModeMenuButton` | Light / dark / system |
| `LogoutTextButton` | Confirm and sign out |
| `FeaturePlaceholderScreen` | Unfinished route shell |

Layout (`lib/src/core/responsive.dart`):

| Width | Name |
|------:|------|
| &lt; 600 | mobile |
| 600–1099 | tablet |
| ≥ 1100 | desktop |
| content max | 1280 |

Use `AppBreakpoints.fromWidth` inside `LayoutBuilder`. Page bodies use `ResponsiveBody`. Side-by-side panels use `ResponsiveRowColumn`. KPI grids use `ResponsiveWrapGrid`. A panel that contains `Expanded` and is placed in a scroll view must be wrapped in `FlexPanel`.

Loading skeletons use the `skeletonizer` package. Spacing in feature columns often uses the `gap` package.

---

## 14. Platform behavior

| Concern | Where | Behavior |
|---------|--------|----------|
| Login video | `login_video_source.dart` + `_io` / `_stub` | Real file on IO; stub where video is unavailable. Asset: `assets/login.mp4`. |
| Android photo picker | `main.dart` | `useAndroidPhotoPicker = true`. |
| Android self-update | `imsh_android_update_service_io.dart` | Compares `pub_semver` of the installed app with `{origin}/imsh-android/` latest, downloads the APK, opens it. Other platforms use the stub (no-ops). UI: `imsh_android_update_layer_io.dart`. Trigger from Account on Android. |
| FCM | `fcm_push_service.dart` | Mobile only. |
| Firebase config | `firebase.json`, `lib/firebase_options.dart`, `android/app/google-services.json` | Project `pantri-91766`. |
| Secure storage | `token_storage.dart` | `FlutterSecureStorage`. |
| Theme persistence | `theme_mode_provider.dart` | `SharedPreferences`. |
| Permissions | emergency + profile photo | location, microphone (voice note), photos, notifications. |

Conditional imports (`*_io.dart` vs `*_stub.dart`) keep web builds from importing `dart:io`.

---

## 15. Helpers

| File | Role |
|------|------|
| `helper/app_timezone.dart` | Lagos `TZDateTime`, must be initialized in `main` |
| `helper/date_formatter.dart` | Display dates (`fullDate` and related) |
| `helper/currency_formatter.dart` | Money display |
| `core/utils/device_platform.dart` | `patientApiPlatform()`, `patientDeviceLabel()` |
| `core/utils/user_error_message.dart` | Safe error strings |
| `core/utils/api_media_url.dart` | Absolute media URLs |
| `services/navigation_service.dart` | The single `AppRouter` instance |

---

## 16. How to add a feature

1. Add a freezed model under `lib/src/models/` if the JSON is new.
2. Add methods on a class in `lib/src/services/` that call `ApiService().dio`. Pass `forPatientId` when the data is patient-scoped and guardians may view it.
3. Register the service in `service_providers.dart`.
4. Add a provider that `watch`es `watchForPatientId(ref)` when the query should follow the family banner.
5. Build the screen under `lib/src/features/<name>/`. Annotate it `@RoutePage()`. Wrap the body in `ResponsiveBody`. Use `ImshSurfaceCard`, `ImshSolidIcon`, and `AppBreakpoints`.
6. Register an `AutoRoute` in `app_router.dart`.
7. Run `dart run build_runner build --delete-conflicting-outputs`.
8. Link it from Home quick actions or Account only if patients should see it in those hubs.

Do not invent a second visual style. Match the Records and Home cards: dense padding, one-line ellipsis, real API data. Missing numbers stay as an em dash, not a fake zero.

---

## 17. Things that are easy to get wrong

- **README vs code.** An older README section described features as “not yet built” and a family API of POST/DELETE. The app now implements those features. Family linking is list-and-view only in this client.
- **Generated files.** Editing `*.g.dart`, `*.freezed.dart`, `app_router.gr.dart`, or `env.g.dart` will be overwritten.
- **Base URL.** The `.env` value is only the first candidate. A faster LAN or production host can win the probe. Check debug output `ClockSyncGate: using …`.
- **Clock skew.** A laptop with the wrong time never reaches login.
- **401 on login** must not clear a session that does not exist. The interceptor special-cases `/patient-auth/login`.
- **Shell guard vs other routes.** Only `/` is guarded. Deep links still need a token or they fail with 401 and land on login.
- **Notifications UI** is not connected to `NotificationService`.
- **`socket_io_client`** is an unused dependency.
- **Family id** on medication pushes is `data['patientId']`. On appointment pushes it is `data['forPatientId']`.
- **Receipt route id** is a payment id, not an invoice id.
- **Theatre detail** does not refetch; it looks up the id in the list already loaded.
