import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/model/todoist_task_due_time.dart';

void main() {
  test('date property', () {
    const due = TodoistTaskDueTime(
      dateStr: '2022-07-31',
      datetimeStr: '2022-07-31T10:30:00',
      recurring: true,
      lang: 'ru',
      string: 'каждый день в 10:30',
    );

    expect(due.nextDate, equals(DateTime(2022, 07, 31)));
  });

  test('datetime property', () {
    const due = TodoistTaskDueTime(
      dateStr: '2022-07-31',
      datetimeStr: '2022-07-31T10:30:00',
      recurring: true,
      lang: 'ru',
      string: 'каждый день в 10:30',
    );

    expect(due.nextDatetime, equals(DateTime(2022, 07, 31, 10, 30, 00)));
  });
}
