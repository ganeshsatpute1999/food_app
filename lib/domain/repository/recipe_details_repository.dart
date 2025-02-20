import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/recipe_details_entity.dart';

abstract class RecipeDetailsRepository {
  Future<Either<Failure, RecipeDetailsEntity>> getRecipeDetail(int recipeId);
}
