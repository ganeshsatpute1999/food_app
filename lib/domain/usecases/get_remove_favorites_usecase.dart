import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';
import '../../core/usecase/usecase.dart';

class RemoveFavoriteUseCase extends UseCase<void, int> {
  final FavoritesRecipeRepository repository;

  RemoveFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int recipeId) {
    return repository.removeFavoriteRecipe(recipeId);
  }
}
