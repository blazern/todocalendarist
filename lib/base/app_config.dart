import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String todoistAccessToken,
  }) = _AppConfig;
}
