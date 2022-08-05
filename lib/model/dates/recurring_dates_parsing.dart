import 'package:todocalendarist/base/result.dart';

enum RecurringDatesParsingError {
  noEvery,
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

  final pieces = _splitByKnownKeywordsAndSpaces(str);

  final endDate = now.add(defaultDuration);

  if (_allWeeklyMarkers.any((m) => pieces.contains(m))) {
    bool isMatch(Iterable<String> markers) {
      return markers.any((m) => pieces.contains(m));
    }

    final Iterable<int> daysOfWeeksIndexes;
    if (isMatch(_weekendMarkers)) {
      daysOfWeeksIndexes = _weekendIndexes;
    } else if (isMatch(_workdayMarkers)) {
      daysOfWeeksIndexes = _workdayIndexes;
    } else if (isMatch(_daysOfWeek.keys)) {
      final marker = _daysOfWeek.keys.firstWhere((k) => pieces.contains(k));
      daysOfWeeksIndexes = {_daysOfWeek[marker]!};
    } else if (isMatch(_everydayMarkers)) {
      daysOfWeeksIndexes = _everydayIndexes;
    } else if (isMatch(_weekMarkers)) {
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
  // TODO:
  // every month (at HOUR)?
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
  // every 27th - not supported
  // every! ... - not supported
  // if (str.startsWith('everyday') || str.startsWith('every day'))
  return Ok(const []);
}

List<String> _splitByKnownKeywordsAndSpaces(String dateStr) {
  dateStr = dateStr.trim();
  final result = <String>[];

  // Sorted ascending - the longest first.
  // This is because often long keywords have short keywords in them,
  // for example, the 'day' keyword is a part of the 'work day' keyword.
  // We don't want the 'every work day at 10' to be matched with the keyword
  // 'day', we want it to be matched with the keyword 'work day'.
  final allKeywordsSorted = _allKeywords.toList()
    ..sort((lhs, rhs) => rhs.length - lhs.length);
  final keywordsRegexes = {
    for (final keyword in _allKeywords) keyword: RegExp('^$keyword( |\$)')
  };
  final endOfSectionRegex = RegExp(' |\$');

  outer:
  while (dateStr.isNotEmpty) {
    for (final keyword in allKeywordsSorted) {
      final regex = keywordsRegexes[keyword]!;
      if (regex.hasMatch(dateStr)) {
        result.add(keyword);
        if (dateStr != keyword) {
          dateStr = dateStr.substring(keyword.length + 1);
        } else {
          dateStr = '';
        }
        continue outer;
      }
    }
    final endOfSectionIndex = dateStr.indexOf(endOfSectionRegex);
    result.add(dateStr.substring(0, endOfSectionIndex));
    if (dateStr.length != endOfSectionIndex) {
      dateStr = dateStr.substring(endOfSectionIndex + 1);
    } else {
      dateStr = '';
    }
  }

  return result;
}

const _every = 'every';

const _daysOfWeek = {
  'monday': 1,
  'mon': 1,
  'tuesday': 2,
  'tue': 2,
  'wednesday': 3,
  'wed': 3,
  'thursday': 4,
  'thu': 4,
  'friday': 5,
  'fri': 5,
  'saturday': 6,
  'sat': 6,
  'sunday': 7,
  'sun': 7,
};

const _months = {
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december',
};

const _everydayMarkers = {
  'day',
  'morning',
  'evening',
};

const _workdayMarkers = {
  'workday',
  'work day',
};

const _weekendMarkers = {
  'weekend',
};

const _weekMarkers = {'week'};

final _allWeeklyMarkers = {
  ..._everydayMarkers,
  ..._workdayMarkers,
  ..._weekendMarkers,
  ..._daysOfWeek.keys,
  ..._weekMarkers,
};

const _month = 'month';
const _year = 'year';

final _allKeywords = {
  _every,
  ..._everydayMarkers,
  ..._workdayMarkers,
  ..._weekendMarkers,
  ..._daysOfWeek.keys,
  ..._workdayMarkers,
  ..._weekendMarkers,
  ..._weekMarkers,
  _month,
  _year,
};

const _everydayIndexes = {
  1,
  2,
  3,
  4,
  5,
  6,
  7,
};

const _workdayIndexes = {
  1,
  2,
  3,
  4,
  5,
};

const _weekendIndexes = {
  6,
  7,
};

extension on DateTime {
  bool operator <(DateTime other) =>
      millisecondsSinceEpoch < other.millisecondsSinceEpoch;
}
