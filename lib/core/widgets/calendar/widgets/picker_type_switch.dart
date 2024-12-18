import 'package:flutter/material.dart';

import '../utils/date_picker_types.dart';

class PickerTypeSwitch extends StatelessWidget {
  final DatePickerType currentType;
  final ValueChanged<DatePickerType> onTypeChanged;

  const PickerTypeSwitch({
    super.key,
    required this.currentType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ChoiceChip(
                label: const Text('Single Date'),
                selected: currentType == DatePickerType.single,
                onSelected: (bool selected) {
                  if (selected) onTypeChanged(DatePickerType.single);
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ChoiceChip(
                label: const Text('Date Range'),
                selected: currentType == DatePickerType.range,
                onSelected: (bool selected) {
                  if (selected) onTypeChanged(DatePickerType.range);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
