import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/profile_remote_datasource.dart';
import 'package:food_app/domain/entities/profile_entity.dart';
import 'package:food_app/domain/repository/profile_repository.dart';


class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final result = await remoteDataSource.getProfile();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Failed to load profile"));
    }
  }
}
