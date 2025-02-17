import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/similar_recipe_entity.dart';

abstract class SimilarRecipeRepository {
  Future<Either<Failure, List<SimilarRecipeEntity>>> getSimilarRecipe();
}