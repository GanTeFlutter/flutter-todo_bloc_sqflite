class VersionManagerService {
  Future<bool> isLatestVersion() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return true;
  }
}
