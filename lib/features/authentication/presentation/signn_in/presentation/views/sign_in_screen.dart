import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/utils/extensions/navigation_extensions.dart';
import 'package:ecommerce_app/features/authentication/data/repos/authentication_data.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_state.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/presentation/views/login_screen.dart';
import '../../../widgets/custom_textfield1.dart';
import '../../../widgets/custom_title.dart';

class signin extends StatelessWidget {
   signin({super.key});


  @override
  Widget build(BuildContext context) {
    final page = authenticaction_pages[1];
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("signin"),),
        body: Center(
          child:  BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)),
                );
              }
              if (state.isRegistered) {
                context.push(LoginScreen()); // Redirect to login after registration
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    customTitle(text: page.title),
                    SizedBox(height: 20,),
                    CustomTextfield(text: page.textfield1, icon1: Icon(Icons.person),controller: _emailController,errorText: state.emailError,),
                    SizedBox(height: 20,),
                    CustomTextfield(text: page.textfield2 ?? '', icon1: Icon(Icons.lock),icon2: Icon(CupertinoIcons.eye),obscureText: true, controller: _passwordController,errorText: state.passwordError,),
                    SizedBox(height: 20,),
                    CustomTextfield(text: page.textfield3 ?? '', icon1: Icon(Icons.lock),icon2: Icon(CupertinoIcons.eye), obscureText: true, controller: _confirmPasswordController,errorText: state.confirmPasswordError,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By clicking the",style: TextStyle(fontSize: 18),),
                        TextButton(child: Text(" Register ",style: TextStyle(color: AppColor.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),onPressed: null),
                        Text("button, you agree to the public offer",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                      ],
                    ),
                    SizedBox(height: 30,),
                    CustomButton(text: page.button,onPressed: state.isLoading
                        ? null
                        : () {
                      context.read<AuthCubit>().register(
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      );
                    },)
                  ],
                ),
              );
            },
          ),
        )
      )
    );
  }
}
