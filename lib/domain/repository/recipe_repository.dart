import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';

abstract class FavoritesRecipeRepository {
  Future<Either<Failure, List<FavoritesRecipeEntity>>> getFavoriteRecipes();
  Future<Either<Failure, void>> addFavoriteRecipe(FavoritesRecipeEntity recipe);
  Future<Either<Failure, void>> removeFavoriteRecipe(int recipeId);
}
