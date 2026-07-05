import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/patient_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/profile_provider.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../../../shared/widgets/logout_button.dart';

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
  const ProfileBody({
    super.key,
    this.includeSliverAppBar = false,
  });

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
        return _ProfileError(
          message: authFlowErrorMessage(error),
          onRetry: () => invalidateProfile(ref),
        );
      },
      data: (patient) => _ProfileContent(patient: patient),
    );

    if (!includeSliverAppBar) {
      return RefreshIndicator(
        onRefresh: () async {
          invalidateProfile(ref);
          await ref.read(profileProvider.future);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: content,
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        invalidateProfile(ref);
        await ref.read(profileProvider.future);
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const ImshSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppDesignTokens.containerPadding,
              AppDesignTokens.spacingMd,
              AppDesignTokens.containerPadding,
              AppDesignTokens.spacing2xl,
            ),
            sliver: SliverToBoxAdapter(child: content),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (staleMessage != null) ...[
            Container(
              padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              ),
              child: Text(
                'Could not refresh profile. Showing cached details.\n$staleMessage',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onErrorContainer,
                ),
              ),
            ),
            const Gap(AppDesignTokens.spacingMd),
          ],
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text(
                    patient.initials,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                Text(
                  patient.fullDisplayName,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppDesignTokens.spacingSm,
                  runSpacing: AppDesignTokens.spacingSm,
                  children: [
                    if (patient.patientId != null &&
                        patient.patientId!.isNotEmpty)
                      _InfoChip(
                        label: 'ID',
                        value: patient.patientId!,
                      ),
                    if (patient.cardNo != null && patient.cardNo!.isNotEmpty)
                      _InfoChip(
                        label: 'Card',
                        value: patient.cardNo!,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(AppDesignTokens.spacingXl),
          _ProfileSection(
            title: 'Personal',
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
          const Gap(AppDesignTokens.spacingLg),
          _ProfileSection(
            title: 'Contact',
            children: [
              _ProfileField(label: 'Email', value: patient.email),
              _ProfileField(label: 'Phone', value: patient.phoneNumber),
              _ProfileField(
                label: 'Address',
                value: patient.addressOfResidence,
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingLg),
          _ProfileSection(
            title: 'Insurance',
            children: [
              _ProfileField(label: 'HMO', value: patient.hmo),
            ],
          ),
          const Gap(AppDesignTokens.spacingXl),
          FilledButton.icon(
            onPressed: () => context.router.push(const EditProfileRoute()),
            icon: const Icon(Icons.edit_outlined, size: 20),
            label: const Text('Edit profile'),
          ),
          const Gap(AppDesignTokens.spacingMd),
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
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(AppDesignTokens.spacingMd),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.value,
  });

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final displayValue =
        value != null && value!.trim().isNotEmpty ? value!.trim() : '—';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
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
          Text(
            displayValue,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusXl),
      ),
      child: Text(
        '$label: $value',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class _ProfileError extends StatelessWidget {
  const _ProfileError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDesignTokens.spacing2xl),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const Gap(AppDesignTokens.spacingMd),
          Text(message, textAlign: TextAlign.center),
          const Gap(AppDesignTokens.spacingMd),
          FilledButton(onPressed: onRetry, child: const Text('Try again')),
        ],
      ),
    );
  }
}
