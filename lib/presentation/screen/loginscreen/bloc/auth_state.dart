part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthState {}
final class AuthLoadingState extends AuthState {
}

final class AuthenticatedState extends AuthState {
  final String userId;

  const AuthenticatedState(this.userId);

  @override
  List<Object> get props => [userId];
}

final class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class UnauthenticatedState extends AuthState {
}