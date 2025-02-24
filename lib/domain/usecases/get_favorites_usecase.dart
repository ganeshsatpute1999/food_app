import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';

import '../../core/usecase/usecase.dart';


class GetFavorites extends UseCase<List<FavoritesRecipeEntity>, NoParams> {
  final  FavoritesRecipeRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<FavoritesRecipeEntity>>> call(NoParams params) {
    return repository.getFavoriteRecipes();
  }
}
