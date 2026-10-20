import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../app_router.gr.dart';
import '../../../core/responsive.dart';
import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/patient_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/profile_provider.dart';
import '../../../providers/theme_mode_provider.dart';
import '../../../services/imsh_android_update_service.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import '../../../shared/widgets/logout_button.dart';
import '../../onboarding/patient_onboarding_host.dart';
import 'profile_avatar_section.dart';

extension PatientProfileDisplay on Patient {
  String get fullDisplayName {
    final parts = [title, surname, firstName, otherName]
        .whereType<String>()
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty);
    final joined = parts.join(' ');
    return joined.isEmpty ? 'Patient' : joined;
  }
}

class ProfileBody extends ConsumerWidget {
  const ProfileBody({super.key, this.includeSliverAppBar = false});

  final bool includeSliverAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final cachedPatient = ref.watch(currentPatientProvider);

    final content = profileAsync.when(
      loading: () => _ProfileContent(
        patient: cachedPatient ?? _placeholderPatient,
        isLoading: cachedPatient == null,
      ),
      error: (error, _) {
        if (cachedPatient != null) {
          return _ProfileContent(
            patient: cachedPatient,
            staleMessage: authFlowErrorMessage(error),
          );
        }
        return ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => invalidateProfile(ref),
        );
      },
      data: (patient) => _ProfileContent(patient: patient),
    );

    Future<void> onRefresh() async {
      invalidateProfile(ref);
      await ref.read(profileProvider.future);
    }

    if (!includeSliverAppBar) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ResponsiveBody(
          expand: false,
          builder: (context, bp) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: content,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const ImshSliverAppBar(),
          SliverFillRemaining(
            hasScrollBody: true,
            child: ResponsiveBody(
              expand: false,
              center: false,
              bottomPadding: 24,
              builder: (context, bp) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _placeholderPatient = Patient(
  id: 'loading',
  firstName: 'Loading',
  surname: 'Patient',
);

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({
    required this.patient,
    this.isLoading = false,
    this.staleMessage,
  });

  final Patient patient;
  final bool isLoading;
  final String? staleMessage;

  static const _sectionGap = 12.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ImshPageHeader(
            title: 'Account',
            subtitle: 'Profile, preferences, and hospital links.',
            icon: Icons.person_outline,
            iconColor: ImshAccentColors.indigo,
          ),
          if (staleMessage != null) ...[
            const Gap(10),
            ImshSurfaceCard(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Could not refresh profile. Showing cached details.\n$staleMessage',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
          const Gap(_sectionGap),
          Center(
            child: ProfileAvatarSection(
              patient: patient,
              fullDisplayName: patient.fullDisplayName,
              infoChips: [
                if (patient.patientId != null && patient.patientId!.isNotEmpty)
                  _InfoChip(label: 'ID', value: patient.patientId!),
                if (patient.cardNo != null && patient.cardNo!.isNotEmpty)
                  _InfoChip(label: 'Card', value: patient.cardNo!),
              ],
            ),
          ),
          const Gap(_sectionGap),
          _ProfileSection(
            title: 'Personal',
            icon: Icons.badge_outlined,
            iconColor: ImshAccentColors.blue,
            children: [
              _ProfileField(
                label: 'Date of birth',
                value: patient.dob != null
                    ? DateFormatter.fullDate(patient.dob!)
                    : null,
              ),
              _ProfileField(label: 'Gender', value: patient.gender),
            ],
          ),
          const Gap(10),
          _ProfileSection(
            title: 'Contact',
            icon: Icons.contact_mail_outlined,
            iconColor: ImshAccentColors.teal,
            children: [
              _ProfileField(label: 'Email', value: patient.email),
              _ProfileField(label: 'Phone', value: patient.phoneNumber),
              _ProfileField(
                label: 'Address',
                value: patient.addressOfResidence,
              ),
            ],
          ),
          const Gap(10),
          _ProfileSection(
            title: 'Insurance',
            icon: Icons.health_and_safety_outlined,
            iconColor: ImshAccentColors.green,
            children: [_ProfileField(label: 'HMO', value: patient.hmo)],
          ),
          const Gap(10),
          const _ProfileSection(
            title: 'Appearance',
            icon: Icons.palette_outlined,
            iconColor: ImshAccentColors.purple,
            children: [_AppearanceOptions()],
          ),
          const Gap(_sectionGap),
          const _ShowAppTipsTile(),
          const ImshSectionHeader(
            title: 'Hospital links',
            icon: Icons.grid_view_rounded,
            iconColor: ImshAccentColors.indigo,
          ),
          const Gap(10),
          _HubTile(
            icon: Icons.water_drop_outlined,
            accent: ImshAccentColors.pink,
            title: 'Cycle tracking',
            subtitle: 'Log periods and see upcoming cycle predictions.',
            onTap: () => context.router.push(const CycleTrackerRoute()),
          ),
          _HubTile(
            icon: Icons.badge_outlined,
            accent: ImshAccentColors.blue,
            title: 'Health card',
            subtitle: 'Show your digital hospital QR card.',
            onTap: () => context.router.push(const HealthCardRoute()),
          ),
          _HubTile(
            icon: Icons.family_restroom_outlined,
            accent: ImshAccentColors.teal,
            title: 'Family accounts',
            subtitle: 'View linked dependents records.',
            onTap: () => context.router.push(const FamilyAccountsRoute()),
          ),
          _HubTile(
            icon: Icons.devices_outlined,
            accent: ImshAccentColors.indigo,
            title: 'Signed-in devices',
            subtitle: 'Manage devices with portal access.',
            onTap: () => context.router.push(const DevicesRoute()),
          ),
          _HubTile(
            icon: Icons.forum_outlined,
            accent: ImshAccentColors.purple,
            title: 'Suggestions & complaints',
            subtitle: 'Send feedback and follow hospital responses.',
            onTap: () => context.router.push(const PatientFeedbackRoute()),
          ),
          if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
            _HubTile(
              icon: Icons.system_update_alt_outlined,
              accent: ImshAccentColors.amber,
              title: 'Check for updates',
              subtitle:
                  'Download the latest IMSH Patient build from the hospital server.',
              onTap: () => ImshAndroidUpdateService.triggerCheckFromUi(),
            ),
          const Gap(10),
          const LogoutTextButton(),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.title,
    required this.children,
    this.icon,
    this.iconColor,
  });

  final String title;
  final List<Widget> children;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImshSectionHeader(title: title, icon: icon, iconColor: iconColor),
          const Gap(10),
          ...children,
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final displayValue = value != null && value!.trim().isNotEmpty
        ? value!.trim()
        : '—';

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(2),
          Text(displayValue, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _AppearanceOptions extends ConsumerWidget {
  const _AppearanceOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    Widget option({
      required ThemeMode value,
      required String title,
      required String subtitle,
      required IconData icon,
      required Color accent,
    }) {
      final selected = themeMode == value;
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ImshSolidIcon(
          icon: icon,
          color: accent,
          size: 32,
          iconSize: 16,
          radius: 8,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: selected
            ? const ImshSolidIcon(
                icon: Icons.check,
                color: ImshAccentColors.green,
                size: 26,
                iconSize: 14,
                radius: 7,
              )
            : Icon(
                Icons.circle_outlined,
                color: Theme.of(context).colorScheme.outline,
              ),
        onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(value),
      );
    }

    return Column(
      children: [
        option(
          value: ThemeMode.light,
          title: 'Light',
          subtitle: 'Always use light appearance.',
          icon: Icons.light_mode_outlined,
          accent: ImshAccentColors.amber,
        ),
        option(
          value: ThemeMode.dark,
          title: 'Dark',
          subtitle: 'Always use dark appearance.',
          icon: Icons.dark_mode_outlined,
          accent: ImshAccentColors.indigo,
        ),
        option(
          value: ThemeMode.system,
          title: 'System',
          subtitle: 'Match the device light or dark setting.',
          icon: Icons.brightness_auto_outlined,
          accent: ImshAccentColors.blue,
        ),
      ],
    );
  }
}

class _ShowAppTipsTile extends ConsumerWidget {
  const _ShowAppTipsTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HubTile(
      icon: Icons.tips_and_updates_outlined,
      accent: ImshAccentColors.indigo,
      title: 'Show app tips',
      subtitle: 'Replay the short tips for Home, visits, doses, and family.',
      onTap: () => replayPatientOnboarding(context, ref),
    );
  }
}

class _HubTile extends StatelessWidget {
  const _HubTile({
    required this.icon,
    required this.accent,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color accent;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            ImshSolidIcon(
              icon: icon,
              color: accent,
              size: 36,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshEllipsisText(
                    text: title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ImshEllipsisText(
                    text: subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(label: '$label: $value', maxWidth: 160);
  }
}
