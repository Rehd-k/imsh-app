import 'store_update_requirement_types.dart';

Future<StoreUpdateRequirement> installedStoreUpdateRequirement(
  String? minAppVersion,
) async {
  return StoreUpdateRequirement.none(minAppVersion);
}
