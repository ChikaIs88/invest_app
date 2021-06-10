import 'package:flutter/material.dart';

import '../constants.dart';
import '../text_styling.dart';
import '../ui_helper.dart';

class TransparentBtn extends StatelessWidget {
  const TransparentBtn(
      {Key? key,
      this.title,
      this.color,
      this.textColor,
      this.marginSet,
      this.width,
      this.tap})
      : super(key: key);
  final String? title;
  final Color? color;
  final Color? textColor;
  final double? width;
  final EdgeInsetsGeometry? marginSet;
  final dynamic tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginSet ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      alignment: Alignment.center,
      height: responsiveHeight(7),
      width: width,
      decoration: BoxDecoration(
          color: color ?? null,
          borderRadius: borderRadius4,
          border:
              Border.all(width: 2, color: color ?? kGrishTransWhiteColor)),
      child: Text('$title', style: TextStyling.h2.copyWith(color: textColor)),
    );
  }
}
