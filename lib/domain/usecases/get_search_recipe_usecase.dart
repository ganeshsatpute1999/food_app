
import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/search_recipe_entity.dart';
import 'package:food_app/domain/repository/search_recipe_repository.dart';

class GetSearchRecipesUsecase {
  final SearchRecipeRepository repository;

  GetSearchRecipesUsecase(this.repository);

  Future<Either<Failure, List<SearchRecipeEntity>>> call(String query) async {
    return await repository.searchRecipes(query);
  }
}
