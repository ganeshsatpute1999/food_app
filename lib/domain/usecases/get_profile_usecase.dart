import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/profile_entity.dart';
import 'package:food_app/domain/repository/profile_repository.dart';
import '../../core/usecase/usecase.dart';

class GetProfile extends UseCase<Profile, NoParams> {
  final ProfileRepository repository;

  GetProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    return repository.getProfile();
  }
}
