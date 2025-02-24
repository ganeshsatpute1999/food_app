import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_bloc.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_event.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_state.dart';
import 'package:food_app/presentation/screen/recipedetailsscreen/UI_recipe_screen/recipedetailsscreen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<FavoritesBloc>()..add(LoadFavorites()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoaded) {
              if (state.favorites.isEmpty) {
                return const Center(child: Text("No Favorites Found"));
              }
              return ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final recipe = state.favorites[index];
                  return ListTile(
                    leading: Image.network(recipe.image, width: 50, height: 50),
                    title: Text(recipe.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        context.read<FavoritesBloc>().add(RemoveFavorite(recipe.id));
                      },
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RecipeDetailScreen(recipeId: recipe.id)),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text("No Data Available"));
          },
        ),
      ),
    );
  }
}
