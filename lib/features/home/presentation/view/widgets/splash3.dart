import 'package:ecommerce_app/features/home/presentation/view/widgets/HomePage.dart';
import 'package:ecommerce_app/features/home/presentation/view/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/splash_cubit.dart';

class splash3 extends StatelessWidget {
  const splash3({super.key});

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Expanded(
                flex: 5,
                child: Container(
                  width: 500,
                  height: 500,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child:Image(image: AssetImage("assets/splash3.png"),fit: BoxFit.contain,),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(50),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () => splashCubit.nextPage(),
                    child: Text("Next",style: TextStyle(fontSize: 20, color: Colors.red),),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
