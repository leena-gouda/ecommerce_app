import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../data/repos/onboarding_data.dart';
import '../../cubit/onboarding_cubit.dart';

class CustomBodyOnboarding extends StatelessWidget {
  const CustomBodyOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        return PageView.builder(
          controller: cubit.pageController,
          onPageChanged: (i) => cubit.chanePage(i),
          itemCount: onboardingPages.length,
          itemBuilder: (context, index) {
            final page = onboardingPages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(page.imagePath, width: 300, height: 300),
                SizedBox(height: 16),
                Text(
                  page.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  page.description,
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
          },
        );
      },
    );
  }
}