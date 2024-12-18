import 'package:flutter/material.dart';

import '../../../core.dart';

/// Custom time picker widget
class CustomTimePicker extends StatefulWidget {
  final List<TimeSlot> timeSlots;
  final Function(TimeSlot) onTimeSelected;
  final TimePickerConfig config;
  final String? initialSelectedTime;
  final String title;

  const CustomTimePicker({
    super.key,
    required this.timeSlots,
    required this.onTimeSelected,
    this.config = const TimePickerConfig(),
    this.initialSelectedTime,
    required this.title,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeSlot? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelectedTime != null) {
      _selectedTimeSlot = widget.timeSlots.firstWhere(
        (slot) => slot.time == widget.initialSelectedTime,
        orElse: () => widget.timeSlots.first,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: widget.config.padding,
          decoration: BoxDecoration(
            color: widget.config.backgroundColor,
            borderRadius: BorderRadius.circular(widget.config.borderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              const SizedBox(height: 24),
              _buildTimeGrid(constraints),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: AppTextStyles.smallText,
    );
  }

  Widget _buildTimeGrid(BoxConstraints constraints) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: widget.timeSlots.length,
      itemBuilder: (context, index) => _buildTimeSlot(widget.timeSlots[index]),
    );
  }

  Widget _buildTimeSlot(TimeSlot timeSlot) {
    final isSelected = _selectedTimeSlot == timeSlot;

    return TimeSlotButton(
      timeSlot: timeSlot,
      isSelected: isSelected,
      config: widget.config,
      onPressed: timeSlot.isAvailable
          ? () {
              setState(() => _selectedTimeSlot = timeSlot);
              widget.onTimeSelected(timeSlot);
            }
          : null,
    );
  }
}
