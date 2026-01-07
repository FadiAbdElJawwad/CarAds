enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final String? errorKey;
  final String? fallbackMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorKey,
    this.fallbackMessage,
  });


  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;
}