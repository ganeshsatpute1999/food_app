import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/auth_remote_data_source.dart';
import 'package:food_app/domain/entities/user_entity.dart';
import 'package:food_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final authModel = await remoteDataSource.login(email, password);
      return Right(authModel.toEntity());
    } catch (e) {
      return Left(AuthFailure("Login failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(String name, String email, String password) async {
    try {
      final authModel = await remoteDataSource.signUp(name, email, password);
      return Right(authModel.toEntity());
    } catch (e) {
      return Left(AuthFailure("Sign-up failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return Right(null);
    } catch (e) {
      return Left(AuthFailure("Logout failed: ${e.toString()}"));
    }
  }
}
