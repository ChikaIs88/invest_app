import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chipln/presentation/global/constants.dart';


class TransparentStatusBar extends StatelessWidget {
  /// the [child] property cannot be null
  const TransparentStatusBar({Key? key, required this.child}) : super(key: key);

  /// Makes the status bar of a view transparent
  ///
  /// This widget accepts a [child] property usually a view

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: kPrimaryColor),
      child: child,
    );
  }
}
