import 'package:flutter_config/flutter_config.dart';
import 'package:todocalendarist/base/app_config.dart';

class AppConfigProvider {
  late final AppConfig _appConfig = AppConfig(
      todoistAccessToken: FlutterConfig.get('TODOIST_TEST_ACCESS_TOKEN'));

  AppConfig appConfig() => _appConfig;
}
