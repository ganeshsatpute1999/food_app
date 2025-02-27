import 'dart:math';

import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/models/similar_recipe_model.dart';

abstract class SimilarRecipeRemoteDataSource {
  Future<DataState<List<SimilarRecipeModel>>> getSimilarRecipe();
}

class SimilarRecipeRemoteDataSourceImpl extends SimilarRecipeRemoteDataSource {
  final DioClient _dioClient;
  final String _apiKey = "959c4acf395b448c832618e4ceeafc75";

  SimilarRecipeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<DataState<List<SimilarRecipeModel>>> getSimilarRecipe() async {
    try {
      final List<String> recipeids = [
        "715538",
        "725538",
        "785538",
        "512538",
        "209128",
      ];
      final Random random = Random();

      String selectedItem = recipeids[random.nextInt(recipeids.length)];

      final response = await _dioClient.dio.get(
        '/recipes/$selectedItem/similar',
        queryParameters: {'apiKey': _apiKey},
      );
      if (response.data != null) {
        final similarRecipe =
            (response.data as List).map((data) {
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
