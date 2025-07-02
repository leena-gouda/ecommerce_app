

import 'package:ecommerce_app/features/onboarding/presentation/views/widgets/custom_body_onboarding.dart';
import 'package:ecommerce_app/features/onboarding/presentation/views/widgets/custom_bottom_onboarding.dart';
import 'package:ecommerce_app/features/onboarding/presentation/views/widgets/custom_heading_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                CustomHeaderOnboarding(),
                Expanded(flex: 2, child: CustomBodyOnboarding()),
                CustomBottomOnboarding(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}