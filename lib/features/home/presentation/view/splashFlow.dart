import 'package:ecommerce_app/features/home/presentation/view/homeepage.dart';
import 'package:ecommerce_app/features/home/presentation/view/HomePage.dart';
import 'package:ecommerce_app/features/home/presentation/view/sign_in.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash1.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash2.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_cubit.dart';
import 'HomePage.dart';

class SplashFlow extends StatelessWidget {
  const SplashFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          switch (state.currentPage) {
            case 0:
              return Homeepage();
            case 1:
              return SplashScreen();
            case 2:
              return splash1();
            case 3:
              return splash2();
            case 4:
              return splash3();
            case 5:
              return sign_in();
            default:
              return splash1();
          }
        },
      ),
    );
  }
}