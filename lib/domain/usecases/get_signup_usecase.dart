import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/user_entity.dart';
import 'package:food_app/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
      String email, String password, String name) {
    return repository.signUp(email, password, name);
  }
}
