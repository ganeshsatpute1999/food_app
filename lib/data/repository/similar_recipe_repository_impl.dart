import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/models/similar_recipe_model.dart';
import 'package:food_app/domain/entities/similar_recipe_entity.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';

class SimilarRecipeRepositoryImpl extends SimilarRecipeRepository {
  final SimilarRecipeRemoteDataSource? similarRecipeRemoteDataSource;

  SimilarRecipeRepositoryImpl(this.similarRecipeRemoteDataSource);

  @override
  Future<Either<Failure, List<SimilarRecipeEntity>>> getSimilarRecipe() async {
    try {
      final DataState<List<SimilarRecipeModel>> response =
          await similarRecipeRemoteDataSource!.getSimilarRecipe();

      if (response is DataSuccess<List<SimilarRecipeModel>>) {
        return Right(response.data!);
      } else if (response is DataFailed<List<SimilarRecipeModel>>) {
        return Left(ServerFailure(response.error?.message ?? 'Error'));
      } else {
        return Left(ServerFailure('Unexpected Error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
