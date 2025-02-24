import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_bloc.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_event.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_state.dart';
import 'package:food_app/presentation/screen/recipedetailsscreen/bloc/recipe_details_bloc.dart';
import 'package:food_app/presentation/widgets/recipe_image_widgets.dart';
import 'package:food_app/presentation/widgets/recipe_info_widget.dart';
import 'package:food_app/presentation/widgets/dish_type_widget.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<RecipeDetailsBloc>()
        ..add(LoadRecipeDetailEvent(recipeId: recipeId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Details'),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            if (state is RecipeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RecipeDetailLoaded) {
              final recipe = state.recipe;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment:
                          Alignment.topLeft, // ✅ Position button to the left
                      children: [
                        RecipeImage(imageUrl: recipe.image),
                        BlocBuilder<FavoritesBloc, FavoritesState>(
                          bloc: locator<FavoritesBloc>(),
                          builder: (context, favState) {
                            final favoritesBloc = locator<FavoritesBloc>();
                            final isFav = favoritesBloc.isFavorite(recipe.id);

                            return Positioned(
                              top: 10,
                              left: 10, // ✅ Button on the left
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.8),
                                child: IconButton(
                                  icon: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFav ? Colors.red : Colors.grey,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    final favoriteRecipe =
                                        FavoritesRecipeEntity(
                                      id: recipe.id,
                                      title: recipe.title,
                                      image: recipe.image,
                                    );

                                    if (isFav) {
                                      favoritesBloc
                                          .add(RemoveFavorite(recipe.id));
                                    } else {
                                      favoritesBloc
                                          .add(AddFavorite(favoriteRecipe));
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    RecipeInfo(recipe: recipe),
                    const SizedBox(height: 16),
                    DishTypes(dishTypes: recipe.dishTypes),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            } else if (state is RecipeDetailError) {
              return const Center(
                  child: Text('Failed to load recipe details.'));
            }
            return const Center(child: Text('No Data Available'));
          },
        ),
      ),
    );
  }
}
