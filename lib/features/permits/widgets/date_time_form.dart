import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';

import '../../../core/widgets/date_time_range_selector.dart';
import '../../../core/widgets/dialog_picker.dart';

class DateTimeForm extends StatelessWidget {
  const DateTimeForm({
    super.key,
    required this.labelTime,
    required this.labelDate,
  });

  final String labelTime;
  final String labelDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DateTimeRangeSelector(
            label: labelTime,
            hintText: '--:--',
            icon: Icons.watch_later_outlined,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => DialogPicker(
                  child: CustomTimePicker(
                    title: 'اختر وقت القدوم',
                    timeSlots: const [
                      TimeSlot(
                        time: '08:00',
                        isAvailable: true,
                      ),
                      TimeSlot(
                        time: '09:00',
                        isAvailable: true,
                      ),
                    ],
                    onTimeSelected: (time) {
                      print(time);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(8),
        Expanded(
          flex: 2,
          child: DateTimeRangeSelector(
            label: labelDate,
            hintText: '--/--/----',
            icon: Icons.calendar_today_rounded,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const DialogPicker(
                  child: CustomDatePicker(
                    title: 'اختر تاريخ القدوم',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
