import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/favorites_remote_datasource.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRecipeRepository {
  final FavoritesRecipeRemoteDataSource favoritesRecipeRemoteDataSource;

  FavoritesRepositoryImpl(this.favoritesRecipeRemoteDataSource);

  @override
  Future<Either<Failure, List<FavoritesRecipeEntity>>> getFavoriteRecipes() async {
    try {
      final result = await favoritesRecipeRemoteDataSource.getFavoriteRecipes();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Failed to load favorite recipes"));
    }
  }

@override
  Future<Either<Failure, void>> addFavoriteRecipe(FavoritesRecipeEntity recipe) async {
    try {
      await favoritesRecipeRemoteDataSource.addFavoriteRecipe(recipe);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add favorite recipe"));
    }
  }
  @override
  Future<Either<Failure, void>> removeFavoriteRecipe(int recipeId) async {
    try {
      await favoritesRecipeRemoteDataSource.removeFavoriteRecipe(recipeId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to remove favorite recipe"));
    }
  }

}
