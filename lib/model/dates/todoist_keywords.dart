
const every = 'every';

const daysOfWeek = {
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

const months = {
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

const everydayMarkers = {
  'day',
  'morning',
  'evening',
};

const workdayMarkers = {
  'workday',
  'work day',
};

const weekendMarkers = {
  'weekend',
};

const weekMarkers = {'week'};

final allWeeklyMarkers = {
  ...everydayMarkers,
  ...workdayMarkers,
  ...weekendMarkers,
  ...daysOfWeek.keys,
  ...weekMarkers,
};

const monthMarkers = { 'month', 'monthly', 'every' };

const pm = 'pm';
const am = 'am';
const atHourMarkers = {
  'at',
};

final allKeywords = {
  every,
  ...everydayMarkers,
  ...workdayMarkers,
  ...weekendMarkers,
  ...daysOfWeek.keys,
  ...workdayMarkers,
  ...weekendMarkers,
  ...weekMarkers,
  ...monthMarkers,
  pm,
  am,
  ...atHourMarkers,
};

const everydayIndexes = {
  1,
  2,
  3,
  4,
  5,
  6,
  7,
};

const workdayIndexes = {
  1,
  2,
  3,
  4,
  5,
};

const weekendIndexes = {
  6,
  7,
};