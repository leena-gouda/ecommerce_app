import 'package:ecommerce_app/features/home/presentation/view/widgets/HomePage.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/view/widgets/splashFlow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "S",
        theme: ThemeData(
            primarySwatch: Colors.purple
        ),
        debugShowCheckedModeBanner: false,
        home: SplashFlow()
    );
  }
}