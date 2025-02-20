import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
 Future<Either<Failure, UserEntity>> signUp(String name, String email, String password);
Future<Either<Failure, void>> logout();
}
