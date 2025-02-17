import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/models/similar_recipe_model.dart';

abstract class SimilarRecipeRemoteDataSource {
  Future<DataState<List<SimilarRecipeModel>>> getSimilarRecipe();
}

class SimilarRecipeRemoteDataSourceImpl extends SimilarRecipeRemoteDataSource {
  final DioClient _dioClient;
  final String _apiKey = "ba29c5a5826045aba900d1951f71619c";

  SimilarRecipeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<DataState<List<SimilarRecipeModel>>> getSimilarRecipe() async {
    try {
      final response = await _dioClient.dio.get(
        '/recipes/715538/similar',
        queryParameters: {'apiKey': _apiKey},
      );
      if (response.data != null) {
        final similarRecipe = (response.data as List).map((data) {
          return SimilarRecipeModel.fromJson(data);
        }).toList();
        return DataSuccess(similarRecipe);
      }
      return DataSuccess([]);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
