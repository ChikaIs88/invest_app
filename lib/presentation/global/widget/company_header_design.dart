import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../text_styling.dart';

class CompanyHeaderDesign extends StatelessWidget {
  const CompanyHeaderDesign({
    Key? key,
    this.title,
    this.show = false,
  }) : super(key: key);
  final String? title;
  final bool? show;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        show == true
            ? IconButton(
                onPressed: Routes.seafarer.pop,
                icon: const Icon(
                  EvaIcons.arrowBack,
                ))
            : const Text(''),
        Text(
          title!,
          style: TextStyling.h2.copyWith(color: Colors.black),
        ),
        const Icon(EvaIcons.sun)
      ],
    );
  }
}
