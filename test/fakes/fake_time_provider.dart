import 'package:todocalendarist/utils/time_provider.dart';

class FakeTimeProvider implements TimeProvider {
  DateTime _now = DateTime.now();

  void setNow(DateTime now) {
    _now = now;
  }

  @override
  DateTime now() => _now;
}
