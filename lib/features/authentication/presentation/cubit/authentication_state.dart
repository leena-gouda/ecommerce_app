class AuthState {
  final bool isLoading;
  final bool isLoggedIn;
  final bool isRegistered;
  final bool isResetSent;
  final String? error; // New: Store error messages
  final String? emailError; // Field-specific errors
  final String? passwordError;
  final String? confirmPasswordError;

  AuthState({
    required this.isLoading,
    required this.isLoggedIn,
    this.isRegistered = false,
    this.isResetSent = false,
    this.error,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  AuthState copyWith({bool? isLoading, bool? isLoggedIn,bool? isRegistered, bool? isResetSent,String? error, String? emailError, String? passwordError, String? confirmPasswordError,}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isRegistered: isRegistered ?? this.isRegistered,
      isResetSent: isResetSent ?? this.isResetSent,
      error: error,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}