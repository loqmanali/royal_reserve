import 'package:flutter/material.dart';

class RowForm extends StatelessWidget {
  const RowForm({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items,
    );
  }
}
