import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/dates/todoist_keywords.dart';
import 'package:todocalendarist/model/dates/todoist_keywords_split.dart';

enum RecurringDatesParsingError {
  noEvery,
  notSupported,
}

const defaultDuration = Duration(days: 60);

Result<List<DateTime>, RecurringDatesParsingError> parseRecurringTimeString(
    String str,
    {required DateTime nextDateTime,
    required DateTime now,
    Duration defaultDuration = defaultDuration}) {
  /// NOTE: every recurring string can have an 'at HOUR' part (e.g. 'at 4pm'),
  /// but we do not handle it, because we already have [nextDateTime] at hand -
  /// whatever value the 'at HOUR' part has, the specified [HOUR] is already a
  /// part of [nextDateTime], and thus we should rather use the value calculated
  /// for us by Todoist.

  final keywordsSplit = TodoistKeywordsSplit.performOn(str);
  final pieces = keywordsSplit.pieces;

  final endDate = now.add(defaultDuration);

  if (allWeeklyMarkers.any((m) => pieces.contains(m))) {
    bool isMatch(Iterable<String> markers) {
      return markers.any((m) => pieces.contains(m));
    }

    final Iterable<int> daysOfWeeksIndexes;
    if (isMatch(weekendMarkers)) {
      daysOfWeeksIndexes = weekendIndexes;
    } else if (isMatch(workdayMarkers)) {
      daysOfWeeksIndexes = workdayIndexes;
    } else if (isMatch(daysOfWeek.keys)) {
      final marker = daysOfWeek.keys.firstWhere((k) => pieces.contains(k));
      daysOfWeeksIndexes = {daysOfWeek[marker]!};
    } else if (isMatch(everydayMarkers)) {
      daysOfWeeksIndexes = everydayIndexes;
    } else if (isMatch(weekMarkers)) {
      daysOfWeeksIndexes = [nextDateTime.weekday];
    } else {
      throw StateError('[_allWeeklyMarkers] contains an unhandled marker');
    }
    final result = <DateTime>[];
    var anotherDate = nextDateTime.add(const Duration(days: 1));
    while (anotherDate < endDate) {
      if (daysOfWeeksIndexes.contains(anotherDate.weekday)) {
        result.add(anotherDate);
      }
      anotherDate = anotherDate.add(const Duration(days: 1));
    }
    return Ok(result);
  }

  final dayOfMonth = keywordsSplit.dayOfMonth;
  if (dayOfMonth != null && monthMarkers.any((m) => pieces.contains(m))) {
    final result = <DateTime>[];

    // var prevDate = nextDateTime;
    var monthIndex = 0;
    while (true) {
      monthIndex += 1;

      final anotherDate = nextDateTime
          .firstDayOfMonth()
          .addMonths(monthIndex)
          .add(Duration(days: dayOfMonth - 1));

      if (endDate < anotherDate) {
        break;
      }
      result.add(anotherDate);
      if (anotherDate.day != dayOfMonth) {
        final lastDatePrevMonth = anotherDate.addMonths(-1).lastDayOfMonth();
        result.insert(result.length - 1, lastDatePrevMonth);
      }
    }
    return Ok(result);
  }
  // NOT DONE:
  // every year (at HOUR)?
  // every DAY_OF_MONTH (at HOUR)?
  // every N days (at HOUR)?
  // every 3rd friday (at HOUR)?
  // support commas
  // support endings such as:
  // - starting aug 3
  // - from aug 3
  // - ending aug 3
  // - until aug 3
  // - for 3 weeks
  // - from 10 May until 20 May
  // every Nth DAY_OF_WEEK (every 3rd friday) - not supported
  // every! ...
  return Err(RecurringDatesParsingError.notSupported);
}

extension on DateTime {
  bool operator <(DateTime other) =>
      millisecondsSinceEpoch < other.millisecondsSinceEpoch;

  DateTime firstDayOfMonth() {
    return DateTime(year, month, 1, hour, minute, second, millisecond, microsecond);
  }

  DateTime lastDayOfMonth() {
    return DateTime(year, month + 1, 0, hour, minute, second, millisecond, microsecond);
  }

  DateTime addMonths(int value) {
    return DateTime(year, month + value, day, hour, minute, second, millisecond, microsecond);
  }
}
