import 'package:flutter/material.dart';
import 'package:food_app/presentation/screen/sidedrawer/UI/side_drawer_screen.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      drawer: SideDrawer(),
      body: Center(child: Text('Favorites')),
    );
  }
}
