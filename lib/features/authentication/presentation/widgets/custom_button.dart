import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
class CustomButton extends StatelessWidget{
  final String text;
  final Color? color;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.white,
          padding: EdgeInsets.fromLTRB(109, 21, 109, 21),
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          text,
        )
    );
  }
}
