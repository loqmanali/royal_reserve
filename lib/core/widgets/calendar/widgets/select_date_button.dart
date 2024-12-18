import 'package:flutter/material.dart';

import '../models/date_selection_state.dart';
import '../utils/date_picker_types.dart';

class SelectDateButton extends StatelessWidget {
  final DateSelectionState selectionState;

  const SelectDateButton({
    super.key,
    required this.selectionState,
  });

  @override
  Widget build(BuildContext context) {
    final buttonText = _getButtonText();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selectionState.pickerType == DatePickerType.single
                    ? Icons.calendar_today
                    : Icons.date_range,
                size: 18,
                color: Colors.black54,
              ),
              const SizedBox(width: 8),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getButtonText() {
    if (selectionState.pickerType == DatePickerType.single) {
      return 'Select a date';
    }
    if (selectionState.rangeStart == null) {
      return 'Select start date';
    }
    if (selectionState.rangeEnd == null) {
      return 'Select end date';
    }
    return 'Date range selected';
  }
}
