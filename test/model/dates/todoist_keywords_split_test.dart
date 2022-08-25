import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/base/pair.dart';
import 'package:todocalendarist/model/dates/todoist_keywords_split.dart';
import 'package:todocalendarist/model/dates/todoist_recurring_dates_parsing.dart';

void main() {
  void timeTest(String dateStr, {required Pair<int, int>? expectedTime}) {
    final split = TodoistKeywordsSplit.performOn(dateStr);
    expect(split.time, equals(expectedTime));
  }

  test('time is extracted from date string', () {
    timeTest('every day at 10', expectedTime: const Pair(10, 00));
    timeTest('every day at 10:0', expectedTime: const Pair(10, 00));
    timeTest('every day at 10:2', expectedTime: const Pair(10, 02));
    timeTest('every day at 10:20', expectedTime: const Pair(10, 20));
    timeTest('every 10:0', expectedTime: const Pair(10, 00));
    timeTest('every 10:2', expectedTime: const Pair(10, 02));
    timeTest('every 10:20', expectedTime: const Pair(10, 20));
    timeTest('every day at 10am', expectedTime: const Pair(10, 00));
    timeTest('every day at 10pm', expectedTime: const Pair(22, 00));
    timeTest('every day at 10:0pm', expectedTime: const Pair(22, 00));
    timeTest('every day at 10:1pm', expectedTime: const Pair(22, 01));
    timeTest('every day at 10:10pm', expectedTime: const Pair(22, 10));
    timeTest('every day at 10:10am', expectedTime: const Pair(10, 10));
    timeTest('every 10am', expectedTime: const Pair(10, 00));
    timeTest('every day 10pm', expectedTime: const Pair(22, 00));
    timeTest('every 10:0pm', expectedTime: const Pair(22, 00));
    timeTest('every day 10:1pm', expectedTime: const Pair(22, 01));
    timeTest('every 10:10pm', expectedTime: const Pair(22, 10));
    timeTest('every day 10:10am', expectedTime: const Pair(10, 10));
  });

  void monthTest(String dateStr, {required int? expectedDayOfMonth}) {
    final split = TodoistKeywordsSplit.performOn(dateStr);
    expect(split.dayOfMonth, equals(expectedDayOfMonth));
  }

  test('month is extracted from date string', () {
    monthTest('every 27th of the month', expectedDayOfMonth: 27);
    monthTest('every 27', expectedDayOfMonth: 27);
    monthTest('every month on 3', expectedDayOfMonth: 3);
    monthTest('every month on 3 at 2pm', expectedDayOfMonth: 3);
    monthTest('every month on 4th', expectedDayOfMonth: 4);
    monthTest('every month on 4th at 10:00', expectedDayOfMonth: 4);
    monthTest('monthly on 3', expectedDayOfMonth: 3);
    monthTest('monthly on 3 at 2pm', expectedDayOfMonth: 3);
    monthTest('monthly on 3 until 2023', expectedDayOfMonth: 3);
    monthTest('monthly on 3 at 2pm until 2024', expectedDayOfMonth: 3);
  });
}
