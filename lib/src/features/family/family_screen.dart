import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/utils/user_error_message.dart';
import '../../models/family_model.dart';
import '../../providers/family_provider.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class FamilyAccountsScreen extends ConsumerWidget {
  const FamilyAccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(familyMembersProvider);
    final view = ref.watch(familyViewProvider);
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Family accounts')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(familyMembersProvider);
          await ref.read(familyMembersProvider.future);
        },
        child: membersAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            children: [
              const Gap(48),
              Text(
                userFacingErrorMessage(error),
                textAlign: TextAlign.center,
              ),
              const Gap(AppDesignTokens.spacingMd),
              Center(
                child: FilledButton(
                  onPressed: () => ref.invalidate(familyMembersProvider),
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
          data: (members) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              children: [
                Text(
                  'Children linked by the hospital frontdesk. '
                  'Select a member to view their appointments and records.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppDesignTokens.spacingLg),
                ImshSurfaceCard(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.person_outline,
                      color: colorScheme.primary,
                    ),
                    title: const Text('My account'),
                    subtitle: const Text('View your own records'),
                    trailing: view.selected == null
                        ? Icon(Icons.check_circle, color: colorScheme.primary)
                        : null,
                    onTap: () {
                      ref.read(familyViewProvider.notifier).clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Showing your own records'),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                if (members.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.family_restroom_outlined,
                          size: 48,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Text(
                          'No linked family members yet.',
                          style: theme.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(AppDesignTokens.spacingSm),
                        Text(
                          'Ask frontdesk to link a child to your account.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                else
                  ...members.map((member) {
                    final selected = view.selected?.id == member.id;
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDesignTokens.spacingSm,
                      ),
                      child: ImshSurfaceCard(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            child: Text(
                              member.displayName.isNotEmpty
                                  ? member.displayName[0].toUpperCase()
                                  : '?',
                            ),
                          ),
                          title: Text(member.displayName),
                          subtitle: Text(
                            [
                              if (member.relationship != null &&
                                  member.relationship!.trim().isNotEmpty)
                                member.relationship!.trim(),
                              if (member.patientId != null &&
                                  member.patientId!.trim().isNotEmpty)
                                member.patientId!.trim(),
                            ].join(' · ').ifEmpty('Linked dependent'),
                          ),
                          trailing: selected
                              ? Icon(
                                  Icons.check_circle,
                                  color: colorScheme.primary,
                                )
                              : const Icon(Icons.chevron_right),
                          onTap: () {
                            ref
                                .read(familyViewProvider.notifier)
                                .select(member);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Viewing records for ${member.displayName}',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
              ],
            );
          },
        ),
      ),
    );
  }
}

extension on String {
  String ifEmpty(String fallback) => isEmpty ? fallback : this;
}
