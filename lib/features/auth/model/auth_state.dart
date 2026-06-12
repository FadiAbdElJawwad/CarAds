import 'user_model.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final String? errorKey;
  final String? fallbackMessage;
  final UserModel? user;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorKey,
    this.fallbackMessage,
    this.user,
  });

  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;

  AuthState copyWith({
    AuthStatus? status,
    String? errorKey,
    String? fallbackMessage,
    UserModel? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorKey: errorKey ?? this.errorKey,
      fallbackMessage: fallbackMessage ?? this.fallbackMessage,
      user: user ?? this.user,
    );
  }
}
