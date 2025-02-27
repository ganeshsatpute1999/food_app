import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/search_recipe_remote_datasource.dart';
import 'package:food_app/domain/entities/search_recipe_entity.dart';
import 'package:food_app/domain/repository/search_recipe_repository.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  final SearchRecipeRemoteDataSource remoteDataSource;

  SearchRecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SearchRecipeEntity>>> searchRecipes(
      String query) async {
    try {
      final result = await remoteDataSource.searchRecipes(query);
      return Right(result.map((recipe) => recipe).toList());
    } catch (e) {
      return Left(ServerFailure("Failed to search recipes: ${e.toString()}"));
    }
  }
}
