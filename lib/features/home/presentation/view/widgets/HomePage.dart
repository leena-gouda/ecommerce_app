import 'package:ecommerce_app/features/home/presentation/cubit/splash_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/splash1.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/splashFlow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return Scaffold(
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(50),
                      child: Image(image: AssetImage("assets/stylish.png")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(50),
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () => splashCubit.nextPage(),
                        child: Text("Next",
                          style: TextStyle(fontSize: 20, color: Colors.red),),
                      ),
                    ),
                  )
                ]
            );
        },
      ),
    );
  }
}
