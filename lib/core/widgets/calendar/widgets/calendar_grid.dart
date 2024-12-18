import 'package:flutter/material.dart';

import '../../../core.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime displayedMonth;
  final DateSelectionState selectionState;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarGrid({
    super.key,
    required this.displayedMonth,
    required this.selectionState,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWeekdayHeader(),
        const SizedBox(height: 8),
        _buildDaysGrid(),
      ],
    );
  }

  Widget _buildWeekdayHeader() {
    const weekdays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays
          .map((day) => SizedBox(
                width: 40,
                child: Text(
                  day,
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildDaysGrid() {
    final days = _calculateDaysForMonth();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: days.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final dayInfo = days[index];
        return DayButton(
          date: dayInfo.date,
          isCurrentMonth: dayInfo.isCurrentMonth,
          isSelected: _isDateSelected(dayInfo.date),
          isInRange: selectionState.isInRange(dayInfo.date),
          isRangeStart: selectionState.isRangeStart(dayInfo.date),
          isRangeEnd: selectionState.isRangeEnd(dayInfo.date),
          onPressed: () => onDateSelected(dayInfo.date),
        );
      },
    );
  }

  bool _isDateSelected(DateTime date) {
    return selectionState.pickerType == DatePickerType.single &&
        selectionState.selectedDate?.year == date.year &&
        selectionState.selectedDate?.month == date.month &&
        selectionState.selectedDate?.day == date.day;
  }

  List<DayInfo> _calculateDaysForMonth() {
    final List<DayInfo> days = [];
    final daysInMonth = CustomDateUtils.getDaysInMonth(displayedMonth);
    final previousMonthDays =
        CustomDateUtils.getPreviousMonthDays(displayedMonth);

    // Add previous month days
    final previousMonth =
        DateTime(displayedMonth.year, displayedMonth.month - 1);
    final daysInPreviousMonth = CustomDateUtils.getDaysInMonth(previousMonth);
    for (int i = 0; i < previousMonthDays; i++) {
      final day = daysInPreviousMonth - previousMonthDays + i + 1;
      days.add(DayInfo(
        date: DateTime(displayedMonth.year, displayedMonth.month - 1, day),
        isCurrentMonth: false,
      ));
    }

    // Add current month days
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DayInfo(
        date: DateTime(displayedMonth.year, displayedMonth.month, i),
        isCurrentMonth: true,
      ));
    }

    // Add next month days
    final remainingDays = 42 - days.length;
    for (int i = 1; i <= remainingDays; i++) {
      days.add(DayInfo(
        date: DateTime(displayedMonth.year, displayedMonth.month + 1, i),
        isCurrentMonth: false,
      ));
    }

    return days;
  }
}

class DayInfo {
  final DateTime date;
  final bool isCurrentMonth;

  DayInfo({
    required this.date,
    required this.isCurrentMonth,
  });
}
