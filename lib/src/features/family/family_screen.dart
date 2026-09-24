import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/responsive.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../core/utils/user_error_message.dart';
import '../../providers/family_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

const _kSectionGap = 10.0;

@RoutePage()
class FamilyAccountsScreen extends ConsumerWidget {
  const FamilyAccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(familyMembersProvider);
    final view = ref.watch(familyViewProvider);
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Family accounts')),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(familyMembersProvider);
            await ref.read(familyMembersProvider.future);
          },
          child: membersAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                ImshErrorPanel(
                  message: userFacingErrorMessage(error),
                  onRetry: () => ref.invalidate(familyMembersProvider),
                ),
              ],
            ),
            data: (members) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  const ImshPageHeader(
                    title: 'Family accounts',
                    subtitle:
                        'Children linked by frontdesk — select to view their records',
                    icon: Icons.family_restroom_outlined,
                    iconColor: ImshAccentColors.pink,
                  ),
                  const Gap(12),
                  ImshSurfaceCard(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const ImshSolidIcon(
                        icon: Icons.person_outline,
                        color: ImshAccentColors.blue,
                        size: 36,
                        iconSize: 18,
                        radius: 10,
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
                  const Gap(_kSectionGap),
                  if (members.isEmpty)
                    const ImshEmptyState(
                      title: 'No linked family members yet',
                      message:
                          'Ask frontdesk to link a child to your account.',
                      icon: Icons.family_restroom_outlined,
                      iconColor: ImshAccentColors.pink,
                    )
                  else
                    ...members.map((member) {
                      final selected = view.selected?.id == member.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: _kSectionGap),
                        child: ImshSurfaceCard(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ImshSolidIcon(
                              icon: Icons.child_care_outlined,
                              color: selected
                                  ? ImshAccentColors.teal
                                  : ImshAccentColors.indigo,
                              size: 36,
                              iconSize: 18,
                              radius: 10,
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
      ),
    );
  }
}

extension on String {
  String ifEmpty(String fallback) => isEmpty ? fallback : this;
}
