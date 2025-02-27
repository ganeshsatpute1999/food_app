part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class FirebaseGetUserEvent extends LoginEvent {}

final class LoginUserEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginUserEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends LoginEvent {}
