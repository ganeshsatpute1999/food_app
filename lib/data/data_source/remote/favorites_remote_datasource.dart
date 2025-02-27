import 'package:dio/dio.dart';
import 'package:food_app/data/models/favorites_model.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';

abstract class FavoritesRecipeRemoteDataSource {
  Future<List<FavoritesRecipeModel>> getFavoriteRecipes();
  Future<void> removeFavoriteRecipe(int recipeId);
  Future<void> addFavoriteRecipe(FavoritesRecipeEntity recipe);
}

class RecipeRemoteDataSourceImpl implements FavoritesRecipeRemoteDataSource {
  final Dio dio;

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<FavoritesRecipeModel>> getFavoriteRecipes() async {
    final response = await dio.get('/favorites');
    return (response.data as List)
        .map((json) => FavoritesRecipeModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> addFavoriteRecipe(FavoritesRecipeEntity recipe) async {
    await dio.post('/favorites', data: {
      "id": recipe.id,
      "title": recipe.title,
      "image": recipe.image,
    });
  }

  @override
  Future<void> removeFavoriteRecipe(int recipeId) async {
    await dio.delete('/favorites/$recipeId');
  }
}
