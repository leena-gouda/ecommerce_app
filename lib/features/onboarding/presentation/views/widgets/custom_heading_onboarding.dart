import 'package:flutter/material.dart';

import 'custom_text_button.dart';

class CustomHeaderOnboarding extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onSkip;

  const CustomHeaderOnboarding({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onSkip,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
            text: "${currentPage + 1}",
            children: [
              TextSpan(
                text: "/$totalPages",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        CustomTextButton(text: "Skip",onPressed: onSkip,),
      ],
    );
  }
}