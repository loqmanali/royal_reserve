// import 'package:flutter/material.dart';

// class CustomTimePicker extends StatefulWidget {
//   final Function(TimeOfDay)? onTimeSelected;
//   final TimeOfDay? initialTime;

//   const CustomTimePicker({
//     super.key,
//     this.onTimeSelected,
//     this.initialTime,
//   });

//   @override
//   State<CustomTimePicker> createState() => _CustomTimePickerState();
// }

// class _CustomTimePickerState extends State<CustomTimePicker> {
//   late TimeOfDay _selectedTime;

//   @override
//   void initState() {
//     super.initState();
//     _selectedTime = widget.initialTime ?? TimeOfDay.now();
//   }

//   void _handleHourChanged(int hour) {
//     setState(() {
//       _selectedTime = TimeOfDay(hour: hour, minute: _selectedTime.minute);
//       widget.onTimeSelected?.call(_selectedTime);
//     });
//   }

//   void _handleMinuteChanged(int minute) {
//     setState(() {
//       _selectedTime = TimeOfDay(hour: _selectedTime.hour, minute: minute);
//       widget.onTimeSelected?.call(_selectedTime);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildTimeHeader(),
//           const SizedBox(height: 16),
//           _buildTimeSelector(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeHeader() {
//     return const Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Text(
//         'Select Time',
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeSelector() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildHourSelector(),
//         const SizedBox(width: 16),
//         const Text(
//           ':',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(width: 16),
//         _buildMinuteSelector(),
//       ],
//     );
//   }

//   Widget _buildHourSelector() {
//     return SizedBox(
//       height: 150,
//       width: 50,
//       child: ListWheelScrollView.useDelegate(
//         itemExtent: 50,
//         perspective: 0.005,
//         diameterRatio: 1.2,
//         physics: const FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           childCount: 24,
//           builder: (context, index) {
//             return Center(
//               child: Text(
//                 index.toString().padLeft(2, '0'),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: index == _selectedTime.hour
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                 ),
//               ),
//             );
//           },
//         ),
//         onSelectedItemChanged: _handleHourChanged,
//       ),
//     );
//   }

//   Widget _buildMinuteSelector() {
//     return SizedBox(
//       height: 150,
//       width: 50,
//       child: ListWheelScrollView.useDelegate(
//         itemExtent: 50,
//         perspective: 0.005,
//         diameterRatio: 1.2,
//         physics: const FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           childCount: 60,
//           builder: (context, index) {
//             return Center(
//               child: Text(
//                 index.toString().padLeft(2, '0'),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: index == _selectedTime.minute
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                 ),
//               ),
//             );
//           },
//         ),
//         onSelectedItemChanged: _handleMinuteChanged,
//       ),
//     );
//   }
// }
