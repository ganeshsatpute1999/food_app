import 'package:flutter/material.dart';
import 'package:food_app/presentation/screen/home_screen/UI/home_screen.dart';
import 'package:food_app/presentation/screen/profile_screen/UI/profile_screen.dart';
import 'package:food_app/presentation/screen/recipe_details_screen/UI/recipedetailsscreen.dart';
import 'package:food_app/presentation/widgets/side_drawer_widget.dart';

List<Map<String, dynamic>> favorites = [];

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.num});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: num == 1
          ? AppBar(
              backgroundColor: Colors.orangeAccent.shade100,
              title: Text('Favorites'),
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
            )
          : null,
      backgroundColor: Colors.orangeAccent.shade100,
      drawer: SideDrawerWidget(),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites added yet!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return Dismissible(
                    key: ValueKey(favorites[index]),
                    onDismissed: (direction) {
                      favorites.remove(favorites[index]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  RecipeDetailScreen(recipeId: item['id']),
                            ),
                          );
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['image']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 60),
                            ),
                          ),
                          title: Text(
                            item['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: num == 1
          ? BottomNavigationBar(
              backgroundColor: Colors.orangeAccent.shade100,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color.fromARGB(255, 87, 87, 87),
              onTap: (index) {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => HomeScreen()),
                  );
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded, size: 40),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_rounded,
                    size: 40,
                    color: Colors.blue,
                  ),
                  label: 'Your Favorites',
                ),
              ],
            )
          : null,
    );
  }
}
