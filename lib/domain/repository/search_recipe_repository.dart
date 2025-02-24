
import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/search_recipe_entity.dart';

abstract class SearchRecipeRepository {
  Future<Either<Failure, List<SearchRecipeEntity>>> searchRecipes(String query);
}
