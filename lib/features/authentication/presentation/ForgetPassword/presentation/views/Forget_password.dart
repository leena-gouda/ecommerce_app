import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/utils/extensions/navigation_extensions.dart';
import 'package:ecommerce_app/features/authentication/data/repos/authentication_data.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/cubit/authentication_state.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_textfield1.dart';
import 'package:ecommerce_app/features/authentication/presentation/widgets/custom_title.dart';
import 'package:ecommerce_app/features/home/presentation/view/homeepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/routing/routes.dart';

class forgetPassword extends StatelessWidget {
  forgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    final page = authenticaction_pages[2];
    final _emailController = TextEditingController();

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
              if (state.isResetSent) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reset email sent!")),
                );
                context.back(); // Return to previous screen
              }
            },
            builder: (context, state) {
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTitle(text: page.title),
                        SizedBox(height: 16,),
                        CustomTextfield(text: page.textfield1, icon1: Icon(Icons.email),controller: _emailController,errorText: state.emailError,),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("*",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColor.primaryColor),),
                            Text(" We will send you a message to set or reset your new password",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColor.textGray),)
                          ],
                        ),
                        SizedBox(height: 16,),
                        CustomButton(text: page.button,onPressed: state.isLoading ? null : () {
                          context.read<AuthCubit>().sendPasswordResetEmail(
                            _emailController.text,
                          );
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
