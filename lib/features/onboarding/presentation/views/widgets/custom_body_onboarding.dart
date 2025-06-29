import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';

class CustomBodyOnboarding extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CustomBodyOnboarding({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    print('Attempting to load image from: $imagePath');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 300, height: 300,errorBuilder: (context, error, stackTrace) {
          return Text('Failed to load image'); // Shows if image fails
        },),
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.textGray,
            height: 2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 100),
      ],
    );
  }
}