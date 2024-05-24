part of '../../eb_commons.dart';

class Env {
  static final Env _instance = Env._internal();
  static Env get shared => _instance;
  Env._internal();

  late PlatformPackage _platformPackage;
  late BuildType _buildType;

  PlatformPackage get platformPackage => _platformPackage;
  bool get isDevMode => _buildType != BuildType.production;

  Future<Env> ensureInitialized() async {
    _platformPackage = await PlatformPackage.fromInfo();
    _buildType = _platformPackage.buildType;
    return this;
  }

  Uri get domainAPI {
    switch (_buildType) {
      case BuildType.production:
        return Uri.parse('https://api.example.com');
      case BuildType.development:
        return Uri.parse('https://dev.api.example.com');
      case BuildType.staging:
        return Uri.parse('https://stg.api.example.com');
      case BuildType.test:
        return Uri.parse('https://qa.api.example.com');
    }
  }

  String get appScheme {
    switch (_buildType) {
      case BuildType.production:
        return 'eggball';
      case BuildType.development:
        return 'eggball_dev';
      case BuildType.staging:
        return 'eggball_stg';
      case BuildType.test:
        return 'eggball_test';
    }
  }

  String get buildName {
    final platformPackage = _platformPackage;
    return (platformPackage.buildType != BuildType.production)
        ? (platformPackage.buildType.shortName).toUpperCase()
        : '';
  }
}
