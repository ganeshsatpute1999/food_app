import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/similar_recipe_entity.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';

class GetSimilarRecipeUsecase {
  final SimilarRecipeRepository similarRecipeRepository;

  GetSimilarRecipeUsecase(this.similarRecipeRepository);

  Future<Either<Failure, List<SimilarRecipeEntity>>> call() async {
    try {
      final result = await similarRecipeRepository.getSimilarRecipe();
      return result;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
