import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/user_entity.dart';
import 'package:food_app/domain/repository/user_repository.dart';

class GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecase(this.userRepository);

  Future<Either<Failure, List<UserEntity>>> call() async {
    try {
      final result = await userRepository.getUser();
      return result;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
