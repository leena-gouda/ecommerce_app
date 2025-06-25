import 'package:ecommerce_app/features/home/presentation/view/HomePage.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash1.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_cubit.dart';

class splash2 extends StatelessWidget {
  const splash2({super.key});

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
            [
              Expanded(
                flex: 3,
                child: Container(
                  width: 500,
                  height: 500,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child:Image(image: AssetImage("assets/splash2.png"),fit: BoxFit.contain),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(50),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () => splashCubit.nextPage(),
                    child: Text("Next",style: TextStyle(fontSize: 20, color: Colors.red),),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
