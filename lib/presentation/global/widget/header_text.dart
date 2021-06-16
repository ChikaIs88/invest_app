import 'package:chipln/presentation/global/constants.dart';
import 'package:flutter/material.dart';

import '../text_styling.dart';
import '../ui_helper.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          verticalSpace(4.5),
          Text(title!,
              style: TextStyling.h1.copyWith(
                color: kTransBlack,
              )),
         verticalSpace(4.5),
          Text(subTitle!,
              textAlign: TextAlign.center,
              style: TextStyling.bodyText1.copyWith(
                color: kTransBlack,
              )),
        ],
      ),
    );
  }
}
