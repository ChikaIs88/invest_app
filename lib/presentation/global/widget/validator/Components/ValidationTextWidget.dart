import 'package:flutter/material.dart';
import '../../../text_styling.dart';
import '../Utilities/SizeConfig.dart';


/// ValidationTextWidget that represent style of each one of them and shows as list of condition that you want to the app user
class ValidationTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final int? value;

  ValidationTextWidget(
      {required this.color, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Container(
          width: SizeConfig.width! * 0.03,
          height: SizeConfig.width! * 0.03,
          child: new CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.width! * 0.03),
          child: new Text(
            text.replaceFirst("-", value.toString()),
           style: TextStyling.bodyText1.copyWith(
                                 fontSize: 13,
                color: Color.fromRGBO(103, 112, 126, 1),
                                )
          ),
        )
      ],
    );
  }
}
