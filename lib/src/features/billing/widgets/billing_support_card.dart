import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class BillingSupportCard extends StatelessWidget {
  const BillingSupportCard({super.key});

  static const _email = 'billing@ibomspecialist.com';
  static const _phone = '0800-IBOM-BILL';

  Future<void> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImshSolidIcon(
            icon: Icons.support_agent_outlined,
            color: ImshAccentColors.blue,
            size: 36,
            iconSize: 18,
            radius: AppDesignTokens.radiusMd,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Questions about your bill?',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(4),
                InkWell(
                  onTap: () => _launch(Uri.parse('mailto:$_email')),
                  child: Text(
                    _email,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.primary,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _launch(Uri.parse('tel:$_phone')),
                  child: Text(
                    _phone,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
