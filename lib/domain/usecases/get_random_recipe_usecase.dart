import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/random_recipe_entity.dart';
import 'package:food_app/domain/repository/random_recipe_repository.dart';

class GetRandomRecipeUsecase {
  final RandomRecipeRepository randomRecipeRepository;

  GetRandomRecipeUsecase(this.randomRecipeRepository);

  Future<Either<Failure, List<RandomRecipeEntity>>> call({
    required List<String> includeTags,
    required List<String> excludeTags,
    required int number,
  }) async {
    try {
      final result = await randomRecipeRepository.getRandomRecipes(
        includeTags: includeTags,
        excludeTags: excludeTags,
        number: number,
      );
      return result;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
