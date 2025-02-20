import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/models/search_recipe_model.dart';

abstract class SearchRecipeRemoteDataSource {
  Future<List<SearchRecipeModel>> searchRecipes(String query);
}

class SearchRecipeRemoteDataSourceImpl implements SearchRecipeRemoteDataSource {
  final DioClient dioClient;

  SearchRecipeRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<SearchRecipeModel>> searchRecipes(String query) async {
    try {
      final response = await dioClient.dio.get(
        "https://api.spoonacular.com/recipes/complexSearch",
        queryParameters: {
          "query": query,
          "apiKey": "ba29c5a5826045aba900d1951f71619c",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data["results"];
        return results.map((json) => SearchRecipeModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load recipes");
      }
    } on DioException catch (e) {
      throw Exception("Server Error: ${e.message}");
    }
  }
}
