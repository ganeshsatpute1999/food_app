import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<RecipeEntity>>> getFavoriteRecipes();
   Future<Either<Failure, void>> addFavoriteRecipe(RecipeEntity recipe);
  Future<Either<Failure, void>> removeFavoriteRecipe(int recipeId);
}
