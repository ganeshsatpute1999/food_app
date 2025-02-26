part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  const LoginSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class FirebaseUsersLoaded extends LoginState {
  final List<UserEntity> user;

  const FirebaseUsersLoaded(this.user);
}

final class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);
}

class LogoutSuccess extends LoginState {}
