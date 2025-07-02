import 'package:ecommerce_app/core/utils/extensions/navigation_extensions.dart';
import 'package:ecommerce_app/features/authentication/data/models/authentication_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/authentication_data.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_state.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_textfield1.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_title.dart';
import 'package:ecommerce_app/features/home/presentation/view/homeepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ForgetPassword/presentation/views/Forget_password.dart';
import '../../../cubit/authentication_cubit.dart';
import '../../../signn_in/presentation/views/sign_in_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  


  @override
  Widget build(BuildContext context) {

    final page = authenticaction_pages[0];
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)),
                );
              }
              if (state.isLoggedIn) {
                context.pushReplacement(Homeepage());
             }
            },
            builder: (context, state) {
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTitle(text: page.title),
                        const SizedBox(height: 16),
                        CustomTextfield(text: page.textfield1, icon1: Icon(Icons.person),controller: _emailController,errorText: state.emailError,),
                        const SizedBox(height: 16),
                        CustomTextfield(text: page.textfield2 ?? '', icon1: Icon(Icons.lock),icon2: Icon(CupertinoIcons.eye),obscureText: true, controller: _passwordController,errorText: state.passwordError),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: (){
                                context.push(forgetPassword());
                              },
                              child: Text("Forget Password?",style: TextStyle(color: AppColor.primaryColor,fontSize: 12,fontWeight: FontWeight.w400),),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: page.button,
                          onPressed: state.isLoading ? null : () {
                            context.read<AuthCubit>().login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Create An Account",style: TextStyle(color: AppColor.textGray,fontSize: 12),),
                            TextButton(
                              onPressed: (){
                                context.push(signin());
                              },
                              child: Text("Sign Up",style: TextStyle(color: AppColor.primaryColor,fontSize: 12,fontWeight: FontWeight.w400),),
                            ),
                          ],
                        ),
                      ],
                    ),
                );
            },
          ),
        ),
      ),
    );
  }
}