import 'package:flutter/material.dart';

import '../../../core.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final Function(DateTimeRange)? onDateRangeSelected;
  final DateTime? initialDate;
  final DateTimeRange? initialDateRange;
  final String title;

  const CustomDatePicker({
    super.key,
    this.onDateSelected,
    this.onDateRangeSelected,
    this.initialDate,
    this.initialDateRange,
    required this.title,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _displayedMonth;
  late DateSelectionState _selectionState;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _displayedMonth = DateTime(now.year, now.month);
    _selectionState = DateSelectionState(
      selectedDate: widget.initialDate,
      rangeStart: widget.initialDateRange?.start,
      rangeEnd: widget.initialDateRange?.end,
    );
  }

  void _handleDateSelection(DateTime date) {
    if (!CustomDateUtils.isDateSelectable(date)) return;

    setState(() {
      if (_selectionState.pickerType == DatePickerType.single) {
        _selectionState = _selectionState.copyWith(selectedDate: date);
        widget.onDateSelected?.call(date);
      } else {
        if (_selectionState.rangeStart == null ||
            (_selectionState.rangeStart != null &&
                _selectionState.rangeEnd != null)) {
          _selectionState = _selectionState.copyWith(
            rangeStart: date,
            rangeEnd: null,
          );
        } else {
          final DateTime rangeStart;
          final DateTime rangeEnd;

          if (date.isBefore(_selectionState.rangeStart!)) {
            rangeStart = date;
            rangeEnd = _selectionState.rangeStart!;
          } else {
            rangeStart = _selectionState.rangeStart!;
            rangeEnd = date;
          }

          _selectionState = _selectionState.copyWith(
            rangeStart: rangeStart,
            rangeEnd: rangeEnd,
          );

          widget.onDateRangeSelected?.call(
            DateTimeRange(start: rangeStart, end: rangeEnd),
          );
        }
      }
    });
  }

  void _handlePickerTypeChanged(DatePickerType type) {
    setState(() {
      _selectionState = _selectionState.copyWith(
        pickerType: type,
        rangeStart: null,
        rangeEnd: null,
      );
    });
  }

  void _handlePreviousMonth() {
    setState(() {
      _displayedMonth =
          DateTime(_displayedMonth.year, _displayedMonth.month - 1);
    });
  }

  void _handleNextMonth() {
    setState(() {
      _displayedMonth =
          DateTime(_displayedMonth.year, _displayedMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarHeader(
            title: widget.title,
            displayedMonth: _displayedMonth,
            onPrevious: _handlePreviousMonth,
            onNext: _handleNextMonth,
          ),
          const Gap(16),
          // PickerTypeSwitch(
          //   currentType: _selectionState.pickerType,
          //   onTypeChanged: _handlePickerTypeChanged,
          // ),
          CalendarGrid(
            displayedMonth: _displayedMonth,
            selectionState: _selectionState,
            onDateSelected: _handleDateSelection,
          ),
        ],
      ),
    );
  }
}
