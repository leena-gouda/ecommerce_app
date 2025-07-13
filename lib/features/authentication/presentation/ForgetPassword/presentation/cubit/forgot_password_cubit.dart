import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail() async {
    if (formKey.currentState?.validate() == true) {
      emit(ForgotPasswordLoading());

      try {
        await auth.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );
        emit(ForgotPasswordSuccess());
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email address';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Please enter a valid email address';
        } else {
          errorMessage = e.message ?? errorMessage;
        }
        emit(ForgotPasswordError(message: errorMessage));
      } catch (e) {
        emit(ForgotPasswordError(message: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}