import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/data_source/remote/random_recipe_remote_data_source.dart';
import 'package:food_app/data/models/random_recipe_model.dart';
import 'package:food_app/domain/entities/random_recipe_entity.dart';
import 'package:food_app/domain/repository/random_recipe_repository.dart';

class RandomRecipeRepositoryImpl implements RandomRecipeRepository {
  final RandomRecipeRemoteDataSource remoteDataSource;

  RandomRecipeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RandomRecipeEntity>>> getRandomRecipes({
    required List<String> includeTags,
    required List<String> excludeTags,
    required int number,
  }) async {
    try {
      // Call API and get response
      final DataState<List<RandomRecipeModel>> response =
          await remoteDataSource.getRandomRecipes(
        includeTags: includeTags,
        excludeTags: excludeTags,
        number: number,
      );
      if (response is DataSuccess) {
        final List<RandomRecipeEntity> recipes = response.data!
            .map((model) => RandomRecipeEntity(
                  id: model.id,
                  title: model.title,
                ))
            .toList();
        return Right(recipes);
      } else if (response is DataFailed) {
        return Left(ServerFailure(response.error!.message ?? "Unknown Error"));
      }

      return Left(ServerFailure("Unexpected error occurred"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
