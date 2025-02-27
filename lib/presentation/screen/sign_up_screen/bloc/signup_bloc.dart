import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/domain/usecases/add_user_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AddUserUsecase addUserUsecase;

  SignupBloc(this.addUserUsecase) : super(SignupInitial()) {
    on<SignUpUserEvent>(_signUpUser);
  }

  Future<void> _signUpUser(
    SignUpUserEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    final result = await addUserUsecase(event.user);
    result.fold(
      (failure) => emit(SignupError(failure.message)),
      (_) => emit(SignupSuccess()),
    );
  }
}
