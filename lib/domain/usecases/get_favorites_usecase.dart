import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';

import '../../core/usecase/usecase.dart';


class GetFavorites extends UseCase<List<RecipeEntity>, NoParams> {
  final RecipeRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(NoParams params) {
    return repository.getFavoriteRecipes();
  }
}
