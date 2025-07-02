import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false, isLoggedIn: false));

  void _clearErrors() {
    emit(state.copyWith(
      error: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
    ));
  }

  Future<void> login(String email, String password) async {
    _clearErrors();
    emit(state.copyWith(isLoading: true));

    if (email.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        emailError: "Email is required",
      ));
      return;
    }

    if (password.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        passwordError: "Password is required",
      ));
      return;
    }

    await Future.delayed(Duration(seconds: 1));

    emit(state.copyWith(
      isLoading: false,
      isLoggedIn: true,
    ));
  }

  Future<void> register({required String email, required String password, required String confirmPassword,}) async {
    _clearErrors();
    emit(state.copyWith(isLoading: true));

    if (email.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        emailError: "Email is required",
      ));
      return;
    }
    if (password.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        passwordError: "Password is required",
      ));
      return;
    }
    if (password != confirmPassword) {
      emit(state.copyWith(
        isLoading: false,
        confirmPasswordError: "Passwords don't match",
      ));
      return;
    }

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      isLoading: false,
      isRegistered: true,
    ));
  }

  Future<void> sendPasswordResetEmail(String email) async {
    _clearErrors();
    emit(state.copyWith(isLoading: true));

    if (email.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        emailError: "Email is required",
      ));
      return;
    }

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      isLoading: false,
      isResetSent: true,
    ));
  }

  void logout() {
    emit(AuthState(isLoading: false, isLoggedIn: false));
  }
}