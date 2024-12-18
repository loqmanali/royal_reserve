class CustomDateUtils {
  static bool isDateSelectable(DateTime date) {
    final now = DateTime.now();
    return date.isAfter(DateTime(now.year, now.month, now.day - 1));
  }

  static int getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  static int getPreviousMonthDays(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final firstWeekdayOfMonth = firstDayOfMonth.weekday;
    return (firstWeekdayOfMonth == 7 ? 0 : firstWeekdayOfMonth);
  }
}
