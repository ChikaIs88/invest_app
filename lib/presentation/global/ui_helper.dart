import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

final verticalSpace16 = verticalSpace(16);

final verticalSpace62 = verticalSpace(62);

final verticalSpace32 = verticalSpace(32);

final verticalSpace37 = verticalSpace(37);

final verticalSpace40 = verticalSpace(40);

final verticalSpace4 = verticalSpace(4);

final verticalSpace24 = verticalSpace(24);

final boxDecoration = BoxDecoration(borderRadius: borderRadius4);
const paddingLR20 = EdgeInsets.symmetric(horizontal: 20);
final BorderRadiusGeometry borderRadius8 =
    BorderRadius.circular(responsiveWidth(8));

final borderRadius4 = BorderRadius.circular(
  responsiveWidth(3),
);

final borderRadiusLR8 = BorderRadius.only(
  topLeft: Radius.circular(responsiveWidth(8)),
  topRight: Radius.circular(responsiveWidth(8)),
);

/// Return a responsive height.
double responsiveHeight(double height) {
  return height.h;
}

/// Return a responsive width.
double responsiveWidth(double width) {
  return width.w;
}

/// Return a [SizedBox] width responsive height.
Widget verticalSpace(double height) {
  return SizedBox(height: height.h);
}

/// Return a [SizedBox] width responsive width.
Widget horizontalSpace(double width) {
  return SizedBox(width: width.w);
}

/// Replace text with more than [maxLength] characters with ellipsis
String shortText(String text, {int maxLength = 45}) {
  return text.length < maxLength
      ? '$text'
      : '${text.replaceRange(maxLength, text.length, "")} ...';
}

/// A [HorizontalDivider] that works.
class MyHorizontalDivider extends StatelessWidget {
  /// Draws a horizontal line, useful for separating widgets.
  const MyHorizontalDivider({
    Key? key,
    this.height = 1,
    this.color,
  }) : super(key: key);

  /// The height of this divider.
  final double height;

  /// The color of this divider.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(0.2),
      ),
    );
  }
}
