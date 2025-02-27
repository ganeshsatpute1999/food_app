import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/repository/user_repository.dart';

class AddUserUsecase {
  final UserRepository repository;

  AddUserUsecase(this.repository);

  Future<Either<Failure, void>> call(Map<String, dynamic> user) async {
    try {
      final result = await repository.addUser(user);
      return result;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
