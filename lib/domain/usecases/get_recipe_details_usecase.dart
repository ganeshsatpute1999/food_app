import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/recipe_details_entity.dart';

import 'package:food_app/domain/repository/recipe_details_repository.dart';

class GetRecipeDetailsUsecase {
  final RecipeDetailsRepository repository;

  GetRecipeDetailsUsecase(this.repository);

  Future<Either<Failure, RecipeDetailsEntity>> call(int recipeId) async {
    return await repository.getRecipeDetail(recipeId);
  }
}
