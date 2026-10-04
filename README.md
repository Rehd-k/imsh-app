# IMSH Patient Portal

Flutter patient app for the IMSH hospital management system. Targets **Android**, **iOS**, and **Web**.

**Full guide:** [docs/CODEBASE.md](docs/CODEBASE.md) — startup, routing, auth, every feature, and the API catalog.

## Stack

- **State:** Riverpod
- **HTTP:** Dio (aligned with the helty staff app)
- **Routing:** auto_route + AuthGuard
- **Models:** freezed + json_serializable
- **Config:** envied (`.env`)

## Getting started

1. Copy environment file:

   ```bash
   cp .env.example .env
   ```

2. Set `API_BASE_URL` in `.env`:
   - Android emulator: `http://10.0.2.2:3000`
   - iOS simulator / web / desktop: `http://localhost:3000`

3. Install dependencies and generate code:

   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Run the app (backend must be running on port 3000):

   ```bash
   flutter run
   ```

5. Ensure backend CORS includes your Flutter web dev origin (e.g. `http://localhost:5xxx`).

## Project structure

```
lib/
  app_router.dart          # auto_route config
  main.dart                # bootstrap
  src/
    config/                # env + API candidates
    core/                  # errors, guards, interceptors, theme, storage
    features/              # one folder per patient feature
    models/                # shared DTOs
    providers/             # Riverpod providers
    services/              # API service layer
    shared/widgets/        # reusable UI
    widgets/               # app-level widgets (clock sync, offline, Android update)
```

Feature behavior, routes, and endpoints are documented in [docs/CODEBASE.md](docs/CODEBASE.md). The in-app notifications screen is still a placeholder; push notifications already deep-link into medications, appointments, and emergency.

## Backend API contract

The client calls the patient portal described below. The **routes this app actually uses** (including medications, cycle, emergency, devices, and theatre) are listed in [docs/CODEBASE.md](docs/CODEBASE.md). Family in the app is list-and-view (`GET /patient/family`); this client does not link or unlink dependents.

### Authentication

| Method | Path | Body | Response |
|--------|------|------|----------|
| POST | `/patient-auth/login` | `{ patientId, dob }` (ISO date `YYYY-MM-DD`) | `{ accessToken, patient }` |
| GET | `/patient-auth/me` | Bearer JWT | `{ patient }` |
| POST | `/patient-auth/logout` | Bearer JWT | `204` |

Login verifies `Patient.patientId` + `Patient.dob`. Patient tokens must **not** access staff routes.

### Patient-scoped resources

All routes require patient JWT and return only the authenticated patient's data (or linked family members where applicable).

| Method | Path | Description |
|--------|------|-------------|
| GET | `/patient/profile` | Patient profile (includes `avatarUrl`) |
| PUT | `/patient/profile` | Update allowed contact fields |
| POST | `/patient/profile/photo` | Upload square profile photo (`multipart/form-data`, field `photo`) — see [docs/backend/patient-profile-photo.md](docs/backend/patient-profile-photo.md) |
| DELETE | `/patient/profile/photo` | Remove profile photo |
| GET | `/patient/appointments` | List appointments (`?page`, `?limit`) |
| GET | `/patient/appointments/:id` | Appointment detail |
| GET | `/patient/lab-reports` | Lab results list |
| GET | `/patient/lab-reports/:id` | Lab result detail (+ PDF URL if applicable) |
| GET | `/patient/radiology-reports` | Radiology reports list |
| GET | `/patient/radiology-reports/:id` | Radiology report detail |
| GET | `/patient/medical-records` | Encounters / records (read-only) |
| GET | `/patient/medical-records/:id` | Single encounter |
| GET | `/patient/invoices` | Bills / invoices |
| GET | `/patient/invoices/:id` | Invoice detail |
| GET | `/patient/receipts/:id` | Receipt metadata / PDF URL |
| GET | `/patient/notifications` | In-app notification feed |
| PATCH | `/patient/notifications/:id/read` | Mark notification read |
| GET | `/patient/family-members` | Linked family accounts |
| POST | `/patient/family-members` | Link dependent `{ patientId, dob, relationship }` |
| DELETE | `/patient/family-members/:id` | Remove link |
| GET | `/patient/health-card` | QR payload `{ qrData, patientId, cardNo, ... }` |

### Existing public endpoint

- `GET /server-time` — used at startup for API discovery and clock sync (already exists).

### New schema (family accounts)

Requires new Prisma models, e.g. `PatientFamilyLink` (guardian patient ↔ dependent patient, relationship enum).

Swagger tag suggestion: `patient-portal`.

## Code generation

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
```

## Launcher icons

```bash
dart run flutter_launcher_icons
```
