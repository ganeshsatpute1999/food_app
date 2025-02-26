import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/collections_screen/UI/collections_screen.dart';
import 'package:food_app/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/profile_screen/UI/profile_screen.dart';
import 'package:food_app/presentation/screen/sidedrawer/UI/side_drawer_screen.dart';
import 'package:food_app/presentation/widgets/bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> pages = [
    BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SimilarRecipeLoaded) {
          final similarRecipe = state.similarRecipe;
          if (similarRecipe.isEmpty) {
            return const Center(child: Text('No Record Found'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: SearchBar(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.orangeAccent),
                  leading: Icon(Icons.search),
                  padding: WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Top Recipes for you',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: similarRecipe.length - 4,
                  itemBuilder: (context, index) {
                    // ignore: no_leading_underscores_for_local_identifiers
                    final _similarRecipe = similarRecipe[index];
                    return ListTile(
                      title: Text('Recipe ID: ${_similarRecipe.id}'),
                      subtitle: Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        clipBehavior: Clip.hardEdge,
                        elevation: 20,
                        child: Stack(
                          children: [
                            Hero(
                              tag: _similarRecipe.id,
                              child: FadeInImage(
                                placeholder: const NetworkImage(
                                    'https://img.spoonacular.com/recipes/716429-556x370.jpg'),
                                image: const NetworkImage(
                                    'https://img.spoonacular.com/recipes/716429-556x370.jpg'),
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black54,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      _similarRecipe.title,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is HomeFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const SizedBox();
      },
    ),
    const CollectionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(GetSimilarRecipeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int selectedIndex = 0;
          String heading = 'Home';

          if (state is HomeTabChanged) {
            selectedIndex = state.selectedIndex;
          }

          if (selectedIndex == 1) {
            heading = 'Favorites';
          }

          return Scaffold(
            backgroundColor: Colors.orangeAccent.shade100,
            drawer: const SideDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.orangeAccent.shade100,
              title: Text(heading),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ProfileScreen(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 22,
                    ),
                  ),
                ),
              ],
            ),
            body: selectedIndex == 0
                ? pages[0]
                : pages[1], // Ensure correct page is displayed
            bottomNavigationBar: BottomNavigationWidget(selectedIndex),
          );
        },
      ),
    );
  }
}






// Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 3 / 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: similarRecipe.length - 4,
//                     itemBuilder: (context, index) {
//                       // ignore: no_leading_underscores_for_local_identifiers
//                       final _similarRecipe = similarRecipe[index];
//                       return ListTile(
//                         title: Text('Recipe ID: ${_similarRecipe.id}'),
//                         subtitle: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                           clipBehavior: Clip.hardEdge,
//                           elevation: 20,
//                           child: Stack(
//                             children: [
//                               Hero(
//                                 tag: 1,
//                                 child: FadeInImage(
//                                   placeholder: NetworkImage(
//                                       'https://img.spoonacular.com/recipes/716429-556x370.jpg'),
//                                   image: NetworkImage(
//                                       'https://img.spoonacular.com/recipes/716429-556x370.jpg'),
//                                   fit: BoxFit.cover,
//                                   height: 200,
//                                   width: double.infinity,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Container(
//                                   color: Colors.black54,
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 40),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         'Recipe Title: ${_similarRecipe.title}',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),







// BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state is HomeLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is RandomRecipeLoaded) {
//             return ListView.builder(
//               itemCount: state.randomrecipes.length,
//               itemBuilder: (context, index) {
//                 final recipe = state.randomrecipes[index];
//                 return ListTile(
//                   title: Text(recipe.title),
//                 );
//               },
//             );
//           } else if (state is HomeFailure) {
//             return Center(child: Text(state.error));
//           }
//           return const Center(child: Text('No data available'));
//         },
//       ),