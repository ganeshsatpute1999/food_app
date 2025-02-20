import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/domain/usecases/get_login_usecase.dart';
import 'package:food_app/domain/usecases/get_signup_usecase.dart';
import 'package:food_app/domain/usecases/get_logout_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this._loginUseCase, this._signUpUseCase, this._logoutUseCase)
      : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _loginUseCase(event.email, event.password);
      result.fold(
        (failure) => emit(AuthErrorState(failure.message)),
        (user) => emit(AuthenticatedState(user.id)),
      );
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result =
          await _signUpUseCase(event.email, event.password, event.name);
      result.fold(
        (failure) => emit(AuthErrorState(failure.message)),
        (user) => emit(AuthenticatedState(user.id)),
      );
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _logoutUseCase();
      result.fold(
        (failure) => emit(AuthErrorState(failure.message)),
        (_) => emit(UnauthenticatedState()),
      );
    });
  }
}
