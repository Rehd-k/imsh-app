import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/storage/token_storage.dart';
import '../../core/utils/api_media_url.dart';
import '../../models/patient_model.dart';

class PatientAvatar extends StatefulWidget {
  const PatientAvatar({
    super.key,
    required this.patient,
    this.radius = 22,
  });

  final Patient? patient;
  final double radius;

  @override
  State<PatientAvatar> createState() => _PatientAvatarState();
}

class _PatientAvatarState extends State<PatientAvatar> {
  Map<String, String>? _headers;

  @override
  void initState() {
    super.initState();
    _loadAuthHeaders();
  }

  Future<void> _loadAuthHeaders() async {
    final token = await TokenStorage.getAccessToken();
    if (!mounted) return;
    if (token == null || token.isEmpty) {
      setState(() => _headers = const {});
      return;
    }
    setState(() {
      _headers = {'Authorization': 'Bearer $token'};
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final patient = widget.patient;
    final radius = widget.radius;
    final avatarUrl = resolveApiMediaUrl(patient?.avatarUrl);

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: colorScheme.primaryContainer,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl,
            httpHeaders: _headers,
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            placeholder: (_, __) => _InitialsAvatar(
              patient: patient,
              radius: radius,
              colorScheme: colorScheme,
              theme: theme,
            ),
            errorWidget: (_, __, ___) => _InitialsAvatar(
              patient: patient,
              radius: radius,
              colorScheme: colorScheme,
              theme: theme,
            ),
          ),
        ),
      );
    }

    return _InitialsAvatar(
      patient: patient,
      radius: radius,
      colorScheme: colorScheme,
      theme: theme,
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({
    required this.patient,
    required this.radius,
    required this.colorScheme,
    required this.theme,
  });

  final Patient? patient;
  final double radius;
  final ColorScheme colorScheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final textStyle = radius >= 40
        ? theme.textTheme.headlineMedium
        : radius >= 20
            ? theme.textTheme.titleSmall
            : theme.textTheme.labelLarge;

    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.primaryContainer,
      child: Text(
        patient?.initials ?? '?',
        style: textStyle?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
