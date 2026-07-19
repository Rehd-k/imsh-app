import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/family_model.dart';
import 'service_providers.dart';

class FamilyViewState {
  const FamilyViewState({this.selected});

  final FamilyMember? selected;

  String? get forPatientId => selected?.id;

  bool get isViewingFamily => selected != null;
}

class FamilyViewNotifier extends StateNotifier<FamilyViewState> {
  FamilyViewNotifier() : super(const FamilyViewState());

  void select(FamilyMember member) {
    state = FamilyViewState(selected: member);
  }

  void selectById(String patientId, {String? subjectName}) {
    state = FamilyViewState(
      selected: FamilyMember(
        id: patientId,
        firstName: subjectName,
      ),
    );
  }

  void clear() {
    state = const FamilyViewState();
  }
}

/// Active family subject for read APIs (`forPatientId`). Null = self.
final familyViewProvider =
    StateNotifierProvider<FamilyViewNotifier, FamilyViewState>((ref) {
  return FamilyViewNotifier();
});

final familyMembersProvider =
    FutureProvider.autoDispose<List<FamilyMember>>((ref) async {
  final service = ref.watch(familyServiceProvider);
  return service.listFamily();
});

String? watchForPatientId(Ref ref) =>
    ref.watch(familyViewProvider).forPatientId;
