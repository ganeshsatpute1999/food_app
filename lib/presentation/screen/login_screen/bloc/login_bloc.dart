import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/data/models/user_model.dart';
import 'package:food_app/domain/entities/user_entity.dart';
import 'package:food_app/domain/usecases/get_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserUsecase _getUserUsecase;

  LoginBloc(this._getUserUsecase) : super(LoginInitial()) {
    on<FirebaseGetUserEvent>(_firebaseGetUserEvent);
    on<LoginUserEvent>(_loginUserEvent);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _firebaseGetUserEvent(
    FirebaseGetUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final result = await _getUserUsecase.call();

      if (result is Left) {
        final failure = (result as Left).value;
        emit(LoginFailure(failure.message));
      } else if (result is Right) {
        final user = (result as Right).value;
        emit(FirebaseUsersLoaded(user));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _loginUserEvent(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final result = await _getUserUsecase.call();

      if (result is Right) {
        final users = (result as Right).value;

        UserModel? matchedUser;

        for (var user in users) {
          if (user.email == event.email && user.password == event.password) {
            matchedUser = user;
            break;
          }
        }

        if (matchedUser != null) {
          emit(LoginSuccess("Login Successful"));
        } else {
          emit(LoginFailure("Invalid Email or Password"));
        }
      } else {
        emit(LoginFailure("Error fetching users"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<LoginState> emit) {
    emit(LogoutSuccess()); // Emit LogoutSuccess to trigger UI navigation
  }
}


// orElse: () => UserModel(id: -1, name: '', email: '', password: ''),