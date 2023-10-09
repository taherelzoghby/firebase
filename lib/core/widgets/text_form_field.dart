import 'package:firebase/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
  });
  final String hint;
  final void Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      cursorColor: AppConsts.mainColor,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hint';
        }
        return null;
      },
      onSaved: (value) {
        //_email = value;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppConsts.white,
        hintText: hint,
        enabledBorder: AppConsts.decoration,
        focusedBorder: AppConsts.decoration,
        errorBorder: AppConsts.decoration,
        focusedErrorBorder: AppConsts.decoration,
      ),
    );
  }
}
