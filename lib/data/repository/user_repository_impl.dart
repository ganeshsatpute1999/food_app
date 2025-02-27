import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/user_remote_data_source.dart';
import 'package:food_app/data/models/user_model.dart';
import 'package:food_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDatasource;

  UserRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, List<UserModel>>> getUser() async {
    try {
      final DataState<List<UserModel>> response =
          await userRemoteDatasource.getUser();

      if (response is DataSuccess<List<UserModel>>) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.error?.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addUser(Map<String, dynamic> user) async {
    try {
      final DataState<void> response = await userRemoteDatasource.addUser(user);

      if (response is DataSuccess<void>) {
        return const Right(null);
      } else {
        return Left(ServerFailure(response.error?.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
