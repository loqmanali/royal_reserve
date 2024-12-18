import '../utils/date_picker_types.dart';

class DateSelectionState {
  final DateTime? selectedDate;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final DatePickerType pickerType;

  DateSelectionState({
    this.selectedDate,
    this.rangeStart,
    this.rangeEnd,
    this.pickerType = DatePickerType.single,
  });

  DateSelectionState copyWith({
    DateTime? selectedDate,
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DatePickerType? pickerType,
  }) {
    return DateSelectionState(
      selectedDate: selectedDate ?? this.selectedDate,
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      pickerType: pickerType ?? this.pickerType,
    );
  }

  bool isInRange(DateTime date) {
    if (rangeStart == null || rangeEnd == null) return false;
    return date.isAfter(rangeStart!) && date.isBefore(rangeEnd!);
  }

  bool isRangeStart(DateTime date) {
    return rangeStart?.isAtSameMomentAs(date) ?? false;
  }

  bool isRangeEnd(DateTime date) {
    return rangeEnd?.isAtSameMomentAs(date) ?? false;
  }
}
