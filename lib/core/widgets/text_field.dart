// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.widget,
    this.readOnly = false,
    this.maxLines = 1,
  }) : super(key: key);
  final String hint;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? widget;
  final bool readOnly;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      cursorColor: AppConsts.mainColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppConsts.white,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppConsts.grey.withOpacity(.7),
        ),
        prefixIcon: widget,
        enabledBorder: AppConsts.decoration,
        focusedBorder: AppConsts.decoration,
        errorBorder: AppConsts.decoration,
        focusedErrorBorder: AppConsts.decoration,
      ),
    );
  }
}
