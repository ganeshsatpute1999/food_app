import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/models/random_recipe_model.dart';

abstract class RandomRecipeRemoteDataSource {
  Future<DataState<List<RandomRecipeModel>>> getRandomRecipes({
    required List<String> includeTags,
    required List<String> excludeTags,
    required int number,
  });
}

class RecipeRemoteDataSourceImpl implements RandomRecipeRemoteDataSource {
  final DioClient _dioClient;
  static const String _apiKey = "ba29c5a5826045aba900d1951f71619c";

  RecipeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<DataState<List<RandomRecipeModel>>> getRandomRecipes({
    required List<String> includeTags,
    required List<String> excludeTags,
    required int number,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        "/recipes/random",
        queryParameters: {
          'number': number,
          'include-tags': includeTags.join(","),
          'exclude-tags': excludeTags.join(","),
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final recipes = (data['recipes'] as List)
            .map((e) => RandomRecipeModel.fromJson(e))
            .toList();

        return DataSuccess(recipes);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(requestOptions: RequestOptions(path: '')),
      );
    }
  }
}
