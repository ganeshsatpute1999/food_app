import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/recipedetailsscreen/UI/recipedetailsscreen.dart';
import 'package:food_app/presentation/screen/search_screen/Ui/search_screen.dart';
import 'package:food_app/presentation/screen/search_screen/bloc/search_bloc.dart';
import 'package:food_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_app/presentation/widgets/drawer_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(GetSimilarRecipeEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Hi, User!",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined,
                  color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const FoodAppDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => locator<SearchBloc>(),
                        child: SearchScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.black54),
                      SizedBox(width: 10),
                      Text(
                        "Search recipes...",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SimilarRecipeLoaded) {
                    final similarRecipe = state.similarRecipe;

                    if (similarRecipe.isEmpty) {
                      return const Center(child: Text('No Record Found'));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      itemCount: similarRecipe.length,
                      itemBuilder: (context, index) {
                        final recipe = similarRecipe[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(
                              recipe.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text(
                              'Recipe ID: ${recipe.id}',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                size: 18, color: Colors.black54),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipeId: recipe.id),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is HomeFailure) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
