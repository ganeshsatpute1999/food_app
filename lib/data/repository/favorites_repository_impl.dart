import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/favorites_remote_datasource.dart';
import 'package:food_app/domain/entities/recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<RecipeEntity>>> getFavoriteRecipes() async {
    try {
      final result = await remoteDataSource.getFavoriteRecipes();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Failed to load favorite recipes"));
    }
  }

@override
  Future<Either<Failure, void>> addFavoriteRecipe(RecipeEntity recipe) async {
    try {
      await remoteDataSource.addFavoriteRecipe(recipe);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add favorite recipe"));
    }
  }
  @override
  Future<Either<Failure, void>> removeFavoriteRecipe(int recipeId) async {
    try {
      await remoteDataSource.removeFavoriteRecipe(recipeId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to remove favorite recipe"));
    }
  }

}
