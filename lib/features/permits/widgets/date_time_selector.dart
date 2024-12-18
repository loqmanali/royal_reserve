import 'package:flutter/material.dart';

import '../../../core/widgets/date_time_range_selector.dart';

class DateTimeSelector extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final VoidCallback onTap;

  const DateTimeSelector({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DateTimeRangeSelector(
        label: label,
        hintText: hintText,
        icon: icon,
        onTap: onTap,
      ),
    );
  }
}
