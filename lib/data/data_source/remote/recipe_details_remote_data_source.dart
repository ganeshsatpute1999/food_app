import 'package:dio/dio.dart';
import 'package:food_app/data/models/recipe_details_model.dart';

abstract class RecipeDetailsRemoteDataSource {
  Future<RecipeDetailsModel> getRecipeDetail(int recipeId);
}

class RecipeDetailsRemoteDataSourceImpl
    implements RecipeDetailsRemoteDataSource {
  final Dio _dio;

  RecipeDetailsRemoteDataSourceImpl(this._dio);

  @override
  Future<RecipeDetailsModel> getRecipeDetail(int recipeId) async {
    final response = await _dio.get(
      'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=ba29c5a5826045aba900d1951f71619c',
    );
    return RecipeDetailsModel.fromJson(response.data);
  }
}
