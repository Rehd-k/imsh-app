import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import 'store_update_requirement_types.dart';
import 'store_version.dart';

Future<StoreUpdateRequirement> installedStoreUpdateRequirement(
  String? minAppVersion,
) async {
  if (!Platform.isAndroid && !Platform.isIOS) {
    return StoreUpdateRequirement.none(minAppVersion);
  }
  final info = await PackageInfo.fromPlatform();
  final current = info.version.trim();
  final minimum = semverCore(minAppVersion ?? '');
  if (minimum == null || !isBelowMinAppVersion(current, minimum)) {
    return StoreUpdateRequirement.none(minAppVersion);
  }
  return StoreUpdateRequirement(
    requiredUpdate: true,
    currentVersion: current,
    minAppVersion: minimum,
  );
}
