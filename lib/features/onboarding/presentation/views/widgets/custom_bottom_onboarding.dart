import 'package:flutter/cupertino.dart';

import '../../../../../core/theme/app_colors.dart';
import 'custom_text_button.dart';

class CustomBottomOnboarding extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const CustomBottomOnboarding({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTextButton(
          text: 'Prev',
          color: AppColor.textGray,
          onPressed: currentPage > 0 ? onPrev : null,
        ),
        Row(
          children: [
            ...List.generate(
              totalPages,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: index == currentPage ? 40 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == currentPage ? AppColor.black : AppColor.textGray,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        CustomTextButton(
          text: currentPage == totalPages - 1 ? 'Get Started' : 'Next',
          color: AppColor.primaryColor,
          onPressed: onNext,
        ),
      ],
    );
  }
}