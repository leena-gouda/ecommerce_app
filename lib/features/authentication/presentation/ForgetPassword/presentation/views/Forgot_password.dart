import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/utils/extensions/navigation_extensions.dart';
import 'package:ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/authentication/data/repos/authentication_data.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_state.dart';
import 'package:ecommerce_app/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../cubit/forgot_password_cubit.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // final page = authenticaction_pages[2];
    // final _emailController = TextEditingController();

    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password?'),
        ),
        body: Center(
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Password reset link sent to your email")),
                );
                context.back();
              }
              else if (state is ForgotPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message ?? 'Error occurred')),
                );
                context.back();
              }
            },
            builder: (context, state) {
              final forgetPasswordcubit = context.read<ForgotPasswordCubit>();
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Enter your email address'),
                        SizedBox(height: 16,),
                        CustomTextFormField(hintText: "Enter your email address", prefixIcon: Icon(Icons.email),controller: forgetPasswordcubit.emailController,keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("*",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColor.primaryColor),),
                            Text(" We will send you a message to set or reset your new password",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColor.textGray),)
                          ],
                        ),
                        SizedBox(height: 16,),
                        CustomButton(text: "Submit",onPressed: () {
                          forgetPasswordcubit.sendPasswordResetEmail();
                        },),
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
