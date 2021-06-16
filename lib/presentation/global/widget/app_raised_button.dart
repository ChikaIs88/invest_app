import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import '../constants.dart';

class AppRaisedButton extends StatelessWidget {
  /// the properties [label] and [onPressed] cannot be null
  const AppRaisedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key);

  /// Customised App Raised Button
  ///
  /// Accept [label] and [onPressed] properties

  final String? label;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;

  /// The button has a default padding of [62] horizontally and [12] vetically
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color ?? kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 62.0, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: Text(
        label!,
        style: TextStyling.h1.copyWith(color: textColor ?? Colors.black),
      ),
    );
  }
}
