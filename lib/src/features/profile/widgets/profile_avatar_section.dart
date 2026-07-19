import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/patient_model.dart';
import '../../../shared/widgets/patient_avatar.dart';
import '../profile_photo_flow.dart';

class ProfileAvatarSection extends ConsumerStatefulWidget {
  const ProfileAvatarSection({
    super.key,
    required this.patient,
    required this.fullDisplayName,
    required this.infoChips,
  });

  final Patient patient;
  final String fullDisplayName;
  final List<Widget> infoChips;

  @override
  ConsumerState<ProfileAvatarSection> createState() =>
      _ProfileAvatarSectionState();
}

class _ProfileAvatarSectionState extends ConsumerState<ProfileAvatarSection> {
  bool _isBusy = false;

  Future<void> _runBusy(Future<void> Function() action) async {
    if (_isBusy) return;
    setState(() => _isBusy = true);
    try {
      await action();
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  bool get _hasPhoto =>
      widget.patient.avatarUrl != null && widget.patient.avatarUrl!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              PatientAvatar(patient: widget.patient, radius: 44),
              if (_isBusy)
                SizedBox(
                  width: 88,
                  height: 88,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.black45,
                    child: const SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            widget.fullDisplayName,
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
            children: widget.infoChips,
          ),
          const Gap(AppDesignTokens.spacingMd),
          OutlinedButton.icon(
            onPressed: _isBusy
                ? null
                : () => _runBusy(
                      () => startProfilePhotoUpload(context, ref),
                    ),
            icon: const Icon(Icons.photo_camera_outlined, size: 20),
            label: Text(_hasPhoto ? 'Change photo' : 'Upload photo'),
          ),
          if (_hasPhoto) ...[
            const Gap(AppDesignTokens.spacingSm),
            TextButton(
              onPressed: _isBusy
                  ? null
                  : () => _runBusy(() => removeProfilePhoto(context, ref)),
              child: const Text('Remove photo'),
            ),
          ],
        ],
      ),
    );
  }
}
