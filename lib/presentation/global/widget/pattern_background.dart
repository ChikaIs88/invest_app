import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';

import 'transparent_status_bar.dart';

class PatternBackground extends StatelessWidget {
  /// the child property may not be null
  const PatternBackground({
    Key? key,
    this.appBar,
    required this.body,
  })  : assert(body != null),
        super(key: key);

  /// A patterned background for the onboarding and the auth screens
  ///
  /// This widget accepts a child property usually a view

  final Widget? body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return TransparentStatusBar(
      child: Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:
                  Assets.images.startup.onboardingbg.svg(fit: BoxFit.fill),
            ),
            SafeArea(child: body!),
          ],
        ),
      ),
    );
  }
}
