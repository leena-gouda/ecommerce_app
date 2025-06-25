import 'package:ecommerce_app/features/home/presentation/view/widgets/sign_in.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/splash1.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/splash2.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/splash3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/splash_cubit.dart';
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
              return Homepage();
            case 1:
              return splash1();
            case 2:
              return splash2();
            case 3:
              return splash3();
            case 4:
              return sign_in();
            default:
              return splash1();
          }
        },
      ),
    );
  }
}