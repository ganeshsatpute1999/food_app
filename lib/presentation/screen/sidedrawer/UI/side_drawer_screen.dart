import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/home_screen/UI/home_screen.dart';
import 'package:food_app/presentation/screen/login_screen/UI/login_screen.dart';
import 'package:food_app/presentation/screen/login_screen/bloc/login_bloc.dart';
// import 'package:food_app/presentation/screen/collections_screen/UI/collections_screen.dart';
import 'package:food_app/presentation/screen/profile_screen/UI/profile_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 250, 209),
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orangeAccent.shade100,
            ),
            child: Row(
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ProfileScreen(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(
                          50), // Ensures ripple effect is circular
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Hrishikesh',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => HomeScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text(
              'Search',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SearchScreen()),
              // );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.favorite),
          //   title: const Text(
          //     'Favorites',
          //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     // Navigator.pop(context);
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => CollectionsScreen()),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 250, 209),
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Close dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Close dialog
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
              context.read<LoginBloc>().add(LogoutEvent()); // Dispatch Logout
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
