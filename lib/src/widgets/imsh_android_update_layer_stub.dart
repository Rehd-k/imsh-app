import 'package:flutter/material.dart';

/// No-op wrapper for platforms without `dart:io` (e.g. web).
class ImshAndroidUpdateLayer extends StatelessWidget {
  const ImshAndroidUpdateLayer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
