import 'package:todocalendarist/utils/app_config_provider.dart';
import 'package:todocalendarist/base/app_config.dart';

class FakeAppConfigProvider implements AppConfigProvider {
  final AppConfig _appConfig;

  FakeAppConfigProvider(this._appConfig);

  @override
  AppConfig appConfig() => _appConfig;
}
