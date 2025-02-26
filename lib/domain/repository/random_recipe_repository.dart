import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/random_recipe_entity.dart';

abstract class RandomRecipeRepository {
  Future<Either<Failure, List<RandomRecipeEntity>>> getRandomRecipes({
    required List<String> includeTags,
    required List<String> excludeTags,
    required int number,
  });
}
