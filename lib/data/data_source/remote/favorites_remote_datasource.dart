import 'package:dio/dio.dart';
import 'package:food_app/data/models/favorites_model.dart';
import 'package:food_app/domain/entities/recipe_entity.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> getFavoriteRecipes();
  Future<void> removeFavoriteRecipe(int recipeId);
    Future<void> addFavoriteRecipe(RecipeEntity recipe);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Dio dio;

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RecipeModel>> getFavoriteRecipes() async {
    final response = await dio.get('/favorites');
    return (response.data as List).map((json) => RecipeModel.fromJson(json)).toList();
  }
   @override
  Future<void> addFavoriteRecipe(RecipeEntity recipe) async {
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
