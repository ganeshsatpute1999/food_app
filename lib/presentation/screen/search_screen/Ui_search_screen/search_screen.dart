import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/recipedetailsscreen/UI_recipe_screen/recipedetailsscreen.dart';
import 'package:food_app/presentation/screen/search_screen/bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SearchBloc>(),
      child: Builder(
        builder: (context) {
          final TextEditingController _searchController =
              TextEditingController();

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Search Recipes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              elevation: 1,
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        if (query.isNotEmpty) {
                          context
                              .read<SearchBloc>()
                              .add(SearchRecipesEvent(query));
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Search recipes...",
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.black54),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear,
                                    color: Colors.black54),
                                onPressed: () {
                                  _searchController.clear();
                                  FocusScope.of(context).unfocus();
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoadedState) {
                        if (state.recipes.isEmpty) {
                          return const Center(
                            child: Text(
                              "No recipes found!",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: state.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = state.recipes[index];

                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              elevation: 3,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    recipe.image,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  recipe.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("Recipe ID: ${recipe.id}"),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 18, color: Colors.black54),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetailScreen(
                                          recipeId: recipe.id),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: Text("Search for recipes"));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
