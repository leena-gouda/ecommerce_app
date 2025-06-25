import 'package:ecommerce_app/features/home/presentation/cubit/splash_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view/splash2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class splash1 extends StatelessWidget {
  const splash1({super.key});

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
              Container(
                width: 500,
                height: 500,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child:Image(image: AssetImage("assets/splash1.png"),fit: BoxFit.contain,),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => splashCubit.nextPage(),
                child: Text("Next",style: TextStyle(fontSize: 20, color: Colors.red),),
              ),
            ]
        ),
      ),
    );
  }
}
