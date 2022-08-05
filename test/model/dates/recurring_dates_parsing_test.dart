import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/model/dates/recurring_dates_parsing.dart';

void main() {
  void everydayTest(String everydayString) {
    final otherDates = parseRecurringTimeString(everydayString,
        nextDateTime: DateTime(2002, 01, 01),
        now: DateTime(2002, 01, 01),
        defaultDuration: const Duration(days: 5));

    expect(
        otherDates.unwrap(),
        equals([
          DateTime(2002, 01, 02),
          DateTime(2002, 01, 03),
          DateTime(2002, 01, 04),
          DateTime(2002, 01, 05),
        ]));
  }

  test('every day', () {
    everydayTest('every day');
    everydayTest('every morning');
    everydayTest('every evening');
    everydayTest('every day at 10');
    everydayTest('every morning at 10');
    everydayTest('every evening at 10');
  });

  void everyWeekendTest(String str) {
    final otherDates = parseRecurringTimeString(str,
        nextDateTime: DateTime(2002, 01, 01),
        now: DateTime(2002, 01, 01),
        defaultDuration: const Duration(days: 14));

    // NOTE: 2002.01.01 is tuesday
    expect(
        otherDates.unwrap(),
        equals([
          DateTime(2002, 01, 05),
          DateTime(2002, 01, 06),
          DateTime(2002, 01, 12),
          DateTime(2002, 01, 13),
        ]));
  }

  test('every weekend', () {
    everyWeekendTest('every weekend');
    everyWeekendTest('every weekend at 11');
  });

  void everyWorkdayTest(String str) {
    final otherDates = parseRecurringTimeString(str,
        nextDateTime: DateTime(2002, 01, 01),
        now: DateTime(2002, 01, 01),
        defaultDuration: const Duration(days: 10));

    // NOTE: 2002.01.01 is tuesday
    expect(
        otherDates.unwrap(),
        equals([
          DateTime(2002, 01, 02),
          DateTime(2002, 01, 03),
          DateTime(2002, 01, 04),
          DateTime(2002, 01, 07),
          DateTime(2002, 01, 08),
          DateTime(2002, 01, 09),
          DateTime(2002, 01, 10),
        ]));
  }

  test('every workday', () {
    everyWorkdayTest('every workday');
    everyWorkdayTest('every workday at 13');
    everyWorkdayTest('every work day');
    everyWorkdayTest('every work day at 14');
  });

  void everySpecificDayOfWeekTest(String str, int dayIndex) {
    final otherDates = parseRecurringTimeString(str,
        nextDateTime: DateTime(2002, 01, 01),
        now: DateTime(2002, 01, 01),
        defaultDuration: const Duration(days: 15));

    // NOTE: 2002.01.01 is tuesday
    final twoWeeks = [
      DateTime(2002, 01, 02),
      DateTime(2002, 01, 03),
      DateTime(2002, 01, 04),
      DateTime(2002, 01, 05),
      DateTime(2002, 01, 06),
      DateTime(2002, 01, 07),
      DateTime(2002, 01, 08),
      DateTime(2002, 01, 09),
      DateTime(2002, 01, 10),
      DateTime(2002, 01, 11),
      DateTime(2002, 01, 12),
      DateTime(2002, 01, 13),
      DateTime(2002, 01, 14),
      DateTime(2002, 01, 15),
    ];
    final expectedDays = twoWeeks.where((date) => date.weekday == dayIndex);

    expect(otherDates.unwrap(), equals(expectedDays.toList()));
  }

  test('every specific day of week', () {
    everySpecificDayOfWeekTest('every monday', 1);
    everySpecificDayOfWeekTest('every mon', 1);
    everySpecificDayOfWeekTest('every tuesday', 2);
    everySpecificDayOfWeekTest('every tue', 2);
    everySpecificDayOfWeekTest('every wednesday', 3);
    everySpecificDayOfWeekTest('every wed', 3);
    everySpecificDayOfWeekTest('every thursday', 4);
    everySpecificDayOfWeekTest('every thu', 4);
    everySpecificDayOfWeekTest('every friday', 5);
    everySpecificDayOfWeekTest('every fri', 5);
    everySpecificDayOfWeekTest('every saturday', 6);
    everySpecificDayOfWeekTest('every sat', 6);
    everySpecificDayOfWeekTest('every sunday', 7);
    everySpecificDayOfWeekTest('every sun', 7);
  });

  void everyWeekTest(String str, DateTime nextDateTime) {
    final otherDates = parseRecurringTimeString(str,
        nextDateTime: nextDateTime,
        now: nextDateTime,
        defaultDuration: const Duration(days: 15));

    final expectedDays = [
      nextDateTime.add(const Duration(days: 7)),
      nextDateTime.add(const Duration(days: 14)),
    ];

    expect(otherDates.unwrap(), equals(expectedDays.toList()));
  }

  test('every week marker', () {
    everyWeekTest('every week', DateTime(2002, 01, 01));
    everyWeekTest('every week', DateTime(2002, 01, 04));
    everyWeekTest('every week at 10', DateTime(2002, 01, 06));
  });
}
