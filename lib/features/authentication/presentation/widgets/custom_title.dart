import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
class customTitle extends StatelessWidget{
  final String text;

  const customTitle({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColor.black,
          fontSize: 36
        ),
      ),
    );
  }
}
