import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
class CustomTextfield extends StatelessWidget{
  final String text;
  final Icon icon1;
  final Icon? icon2;
  final bool obscureText;
  final TextEditingController? controller;
  final String? errorText;

  const CustomTextfield({
    super.key,
    required this.text ,
    required this.icon1,
    this.icon2,
    this.controller,
    this.obscureText = false,
    this.errorText
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        fillColor: AppColor.textGray,
        border: OutlineInputBorder(),
        prefixIcon: icon1,
        suffixIcon: icon2,
        errorText: errorText
      ),
    );
  }
}
