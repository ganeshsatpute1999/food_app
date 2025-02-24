import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';
import '../../core/usecase/usecase.dart';

class AddFavoriteUseCase extends UseCase<void, FavoritesRecipeEntity> {
  final FavoritesRecipeRepository repository;

  AddFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(FavoritesRecipeEntity recipe) async {
    return repository.addFavoriteRecipe(recipe); // ✅ Ensure this function is properly implemented
  }
}
