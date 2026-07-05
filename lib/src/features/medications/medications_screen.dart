import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/imsh_app_bar.dart';
import 'widgets/medications_body.dart';

@RoutePage()
class MedicationsScreen extends ConsumerWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: ImshAppBar(title: Text('Medications')),
      body: MedicationsBody(),
    );
  }
}
