import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
}
