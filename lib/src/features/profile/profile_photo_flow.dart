import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/api_media_url.dart';
import '../../core/utils/user_error_message.dart';
import '../../models/patient_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/profile_provider.dart';
import '../../providers/service_providers.dart';

const _profilePhotoSize = 512;

Future<void> startProfilePhotoUpload(BuildContext context, WidgetRef ref) async {
  final source = await _pickImageSource(context);
  if (source == null || !context.mounted) return;

  final picker = ImagePicker();
  final picked = await picker.pickImage(
    source: source,
    maxWidth: 2048,
    maxHeight: 2048,
    imageQuality: 90,
  );
  if (picked == null || !context.mounted) return;

  final cropped = await ImageCropper().cropImage(
    sourcePath: picked.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop profile photo',
        toolbarColor: Theme.of(context).colorScheme.primary,
        toolbarWidgetColor: Theme.of(context).colorScheme.onPrimary,
        lockAspectRatio: true,
        hideBottomControls: false,
      ),
      IOSUiSettings(
        title: 'Crop profile photo',
        aspectRatioLockEnabled: true,
        resetAspectRatioEnabled: false,
      ),
      WebUiSettings(
        context: context,
        presentStyle: WebPresentStyle.dialog,
      ),
    ],
    compressFormat: ImageCompressFormat.jpg,
    maxWidth: _profilePhotoSize,
    maxHeight: _profilePhotoSize,
  );
  if (cropped == null || !context.mounted) return;

  await _uploadProfilePhoto(context, ref, cropped.path);
}

Future<void> removeProfilePhoto(BuildContext context, WidgetRef ref) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Remove profile photo?'),
      content: const Text(
        'Your initials will be shown instead of a photo across the app.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Remove'),
        ),
      ],
    ),
  );
  if (confirmed != true || !context.mounted) return;

  try {
    final service = ref.read(profileServiceProvider);
    final updated = await service.deleteProfilePhoto();
    _syncPatientState(ref, updated);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile photo removed.')),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(userFacingErrorMessage(e))),
      );
    }
  }
}

Future<ImageSource?> _pickImageSource(BuildContext context) {
  return showModalBottomSheet<ImageSource>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_camera_outlined),
            title: const Text('Take photo'),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Choose from gallery'),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ],
      ),
    ),
  );
}

Future<void> _uploadProfilePhoto(
  BuildContext context,
  WidgetRef ref,
  String filePath,
) async {
  try {
    final service = ref.read(profileServiceProvider);
    final updated = await service.uploadProfilePhoto(filePath);
    final resolvedUrl = resolveApiMediaUrl(updated.avatarUrl);
    if (resolvedUrl != null) {
      await CachedNetworkImage.evictFromCache(resolvedUrl);
    }
    _syncPatientState(ref, updated);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile photo updated.')),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(userFacingErrorMessage(e))),
      );
    }
  }
}

void _syncPatientState(WidgetRef ref, Patient patient) {
  ref.read(patientAuthProvider.notifier).setPatient(patient);
  invalidateProfile(ref);
}
