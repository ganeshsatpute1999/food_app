part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends SignupEvent {
  final Map<String, dynamic> user;

  const SignUpUserEvent(this.user);

  @override
  List<Object> get props => [user];
}
