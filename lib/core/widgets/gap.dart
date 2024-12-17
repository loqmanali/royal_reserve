import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  final double gap;

  const Gap(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Adjust the gap size based on the screen width
        final screenWidth = MediaQuery.sizeOf(context).width;
        final responsiveSize = gap * (screenWidth / 375.0);

        return SizedBox(
          width: responsiveSize.w,
          height: responsiveSize.h,
        );
      },
    );
  }
}
