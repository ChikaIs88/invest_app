import 'package:flutter/material.dart';

import '../constants.dart';
import '../text_styling.dart';

class AppFlatButton extends StatelessWidget {
  /// the properties [label] and [onPressed] cannot be null
  const AppFlatButton({
    Key? key,
    required this.label,
    required this.onPressed, this.color,
  }) : super(key: key);

  /// Customised App Flat Button
  ///
  /// Accept [label] and [onPressed] properties

  final String? label;
  final Function()? onPressed;
  final Color? color; 

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(backgroundColor: color),
      child: Text(
        label!,
        style: TextStyling.h2.copyWith(color: kGrishTransWhiteColor),
      ),
    );
  }
}
