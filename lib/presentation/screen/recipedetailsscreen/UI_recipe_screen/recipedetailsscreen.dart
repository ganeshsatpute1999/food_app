import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';

import 'package:food_app/presentation/screen/recipedetailsscreen/bloc/recipe_details_bloc.dart';
import 'package:food_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_app/presentation/widgets/dish_type_widget.dart';
import 'package:food_app/presentation/widgets/recipe_image_widgets.dart';
import 'package:food_app/presentation/widgets/recipe_info_widget.dart';

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
          title: const Text(
            'Recipe Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark_rounded, color: Colors.grey),
              onPressed: () {
                // context.read<FavoritesBloc>().add(AddFavorite(favoriteRecipe));
              },
            ),
          ],
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
                    RecipeImage(imageUrl: recipe.image),
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
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
