import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/models/recipe_details_model.dart';

abstract class RecipeDetailsRemoteDataSource {
  Future<RecipeDetailsModel> getRecipeDetail(int recipeId);
}

class RecipeDetailsRemoteDataSourceImpl
    implements RecipeDetailsRemoteDataSource {
  final DioClient _dioClient;
  final String _apiKey = "959c4acf395b448c832618e4ceeafc75";

  RecipeDetailsRemoteDataSourceImpl(this._dioClient);

  @override
  Future<RecipeDetailsModel> getRecipeDetail(int recipeId) async {
    final response = await _dioClient.dio.get(
      '/recipes/$recipeId/information',
      queryParameters: {'apiKey': _apiKey},
    );

    return RecipeDetailsModel.fromJson(response.data);
  }
}
