import 'package:beard_friends/App%20Constants/App%20Text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReusableRow extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String label, title;
  final double? w;
  const ReusableRow(
      {Key? key,
      required this.label,
      required this.title,
      required this.mainAxisAlignment,
      required this.crossAxisAlignment,
      this.w})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text16Medium(text: label),
       SizedBox(width: 80.w),
        Text16Medium(text: title)
      ],
    );
  }
}
