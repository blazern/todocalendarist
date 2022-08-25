import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todocalendarist/base/pair.dart';
import 'package:todocalendarist/model/dates/todoist_keywords.dart';

part 'todoist_keywords_split.freezed.dart';

@freezed
class TodoistKeywordsSplit with _$TodoistKeywordsSplit {
  const factory TodoistKeywordsSplit({
    required List<String> pieces,
    required Pair<int, int>? time,
    required int? dayOfMonth,
  }) = _TodoistKeywordsSplit;

  static TodoistKeywordsSplit performOn(String dateStr) {
    final pieces = _extractPieces(dateStr);
    final timePieceIndex = _findTimePieceIndex(pieces);
    final time = _extractTimeFrom(pieces, timePieceIndex);
    final dayOfMonth = _extractDayOfMonth(pieces, timePieceIndex: timePieceIndex);
    return TodoistKeywordsSplit(pieces: pieces, time: time, dayOfMonth: dayOfMonth);
  }

  static List<String> _extractPieces(String dateStr) {
    dateStr = dateStr.trim().toLowerCase();
    final pieces = <String>[];
    
    // Sorted ascending - the longest first.
    // This is because often long keywords have short keywords in them,
    // for example, the 'day' keyword is a part of the 'work day' keyword.
    // We don't want the 'every work day at 10' to be matched with the keyword
    // 'day', we want it to be matched with the keyword 'work day'.
    final allKeywordsSorted = allKeywords.toList()
      ..sort((lhs, rhs) => rhs.length - lhs.length);
    final keywordsRegexes = {
      for (final keyword in allKeywords) keyword: RegExp('^$keyword( |\$)')
    };
    final endOfSectionRegex = RegExp(' |\$');
    
    outer: while (dateStr.isNotEmpty) {
      for (final keyword in allKeywordsSorted) {
        final regex = keywordsRegexes[keyword]!;
        if (regex.hasMatch(dateStr)) {
          pieces.add(keyword);
          if (dateStr != keyword) {
            dateStr = dateStr.substring(keyword.length + 1);
          } else {
            dateStr = '';
          }
          continue outer;
        }
      }
      final endOfSectionIndex = dateStr.indexOf(endOfSectionRegex);
      pieces.add(dateStr.substring(0, endOfSectionIndex));
      if (dateStr.length != endOfSectionIndex) {
        dateStr = dateStr.substring(endOfSectionIndex + 1);
      } else {
        dateStr = '';
      }
    }
    return pieces;
  }
}

int _findTimePieceIndex(List<String> pieces) {
  int atIndex = -1;
  for (final at in atHourMarkers) {
    atIndex = pieces.indexOf(at);
    if (atIndex != -1) {
      break;
    }
  }
  if (atIndex != -1 && atIndex < pieces.length - 1) {
    return atIndex + 1;
  }

  for (final regex in _amPmRegexes.values) {
    final index = pieces.indexWhere((piece) => regex.hasMatch(piece));
    if (index != -1) {
      return index;
    }
  }

  final index = pieces.indexWhere((piece) => piece.contains(':'));
  if (index != -1) {
    return index;
  }

  return -1;
}

Pair<int, int>? _extractTimeFrom(List<String> pieces, int index) {
  if (index == -1) {
    return null;
  }

  String timePiece = pieces[index];

  bool pmFound = false;
  if (timePiece.isNotEmpty) {
    for (final pair in _amPmRegexes.entries) {
      final ampm = pair.key;
      final regex = pair.value;
      if (regex.hasMatch(timePiece)) {
        if (ampm == pm) {
          pmFound = true;
        }
        timePiece = timePiece.substring(0, timePiece.length - ampm.length);
        break;
      }
    }
  }

  if (timePiece.isNotEmpty) {
    int? hour;
    int? minute;
    if (timePiece.contains(':')) {
      hour = int.tryParse(timePiece.split(':').first);
      minute = int.tryParse(timePiece.split(':').last);
    } else {
      hour = int.tryParse(timePiece);
    }
    minute ??= 0;

    if (hour != null) {
      if (pmFound) {
        hour += 12;
      }
      return Pair(hour, minute);
    }
  }
  return null;
}

int? _extractDayOfMonth(List<String> pieces, {required int timePieceIndex}) {
  final numberPieces = <String>[];
  for (var index = 0; index < pieces.length; ++index) {
    final piece = pieces[index];
    if (_numberRegex.hasMatch(piece) && index != timePieceIndex) {
      numberPieces.add(piece);
    }
  }

  final numbers = <int>[];
  for (final piece in numberPieces) {
    final numberSubstring = piece.replaceAll(RegExp('[^0-9]'), '');
    final number = int.tryParse(numberSubstring);
    if (number != null) {
      numbers.add(number);
    }
  }

  numbers.retainWhere((number) => 0 < number && number <= 31);

  if (1 < numbers.length) {
    // TODO: report an error - cannot determine which number is the day of the month
    return null;
  }

  return numbers.isNotEmpty ? numbers.first : null;
}

final _amPmRegexes = {
  am: RegExp('\\d$am'),
  pm: RegExp('\\d$pm'),
};

final _numberRegex = RegExp('\\d');
