import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invest_app/presentation/global/constants.dart';
import 'package:invest_app/presentation/global/text_styling.dart';

import '../ui_helper.dart';

class AppTextField extends StatelessWidget {
  /// Customised App Text Button
  ///
  /// All Properties can be null
  final String? label;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final bool? enabled;
  final Widget? endWidget;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.enabled,
    this.onFieldSubmitted,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.prefixIcon,
    this.keyboardType,
    this.errorText,
    this.endWidget,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label != null
                ? Text(label!,
                    style: TextStyling.bodyText1.copyWith(
                      fontSize: 13,
                      color: Color.fromRGBO(103, 112, 126, 1),
                    ))
                : const SizedBox.shrink(),
            endWidget ?? const SizedBox.shrink(),
          ],
        ),
        label != null ? verticalSpace(2) : SizedBox.shrink(),
        TextFormField(
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.done,
          style: TextStyling.bodyText1.copyWith(color: Colors.black45),
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          enabled: enabled,
          cursorColor: kPrimaryColor,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText ?? false,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: Color.fromRGBO(103, 112, 126, 1),
            ),
            suffixIcon: suffixIcon,
            errorText: errorText,
            contentPadding: const EdgeInsets.all(16.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Color.fromRGBO(248, 248, 248, 1),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kGreyColor, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kGreyColor, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
