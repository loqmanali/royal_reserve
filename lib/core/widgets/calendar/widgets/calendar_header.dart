import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core.dart';

class CalendarHeader extends StatefulWidget {
  final DateTime displayedMonth;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final String title;

  const CalendarHeader({
    super.key,
    required this.displayedMonth,
    required this.onPrevious,
    required this.onNext,
    required this.title,
  });

  @override
  State<CalendarHeader> createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  int selectedType = 0;
  final List<String> dateTypes = [
    'اليوم',
    'الغد',
    'الأسبوع القادم',
  ];

  void _handleTypeSelected(int index) {
    setState(() {
      selectedType = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.smallText,
              ),
              const Gap(8),
              // CustomChip(
              //   borderRadius: 8,
              //   label: dateTypes[selectedType],
              //   dateTypes: dateTypes,
              //   selectedType: selectedType,
              //   onTap: _handleTypeSelected,
              // ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: widget.onPrevious,
              color: Colors.black54,
            ),
            Text(
              DateFormat('MMMM yyyy').format(widget.displayedMonth),
              style: AppTextStyles.smallText,
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: widget.onNext,
              color: Colors.black54,
            ),
          ],
        ),
      ],
    );
  }
}
