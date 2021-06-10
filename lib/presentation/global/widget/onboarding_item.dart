import 'package:flutter/material.dart';

import '../text_styling.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    required this.svgUrl,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  /// This widget describes how an onboarding item should look like
  ///
  /// It accepts [svgUrl], [title] and [description] as properties
  /// All properties cannot be null
  final String svgUrl;
  final String title;
  final String description;

  /// Vertical spaces are given using [Spacer] for responsiveness
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        Image.asset(
          svgUrl,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
        const Spacer(flex: 2),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: TextStyling.h1,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            description,
            style: TextStyling.h2,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
