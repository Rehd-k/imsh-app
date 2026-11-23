class StoreUpdateRequirement {
  const StoreUpdateRequirement({
    required this.requiredUpdate,
    this.currentVersion,
    this.minAppVersion,
  });

  const StoreUpdateRequirement.none(String? minAppVersion)
    : this(requiredUpdate: false, minAppVersion: minAppVersion);

  final bool requiredUpdate;
  final String? currentVersion;
  final String? minAppVersion;
}
