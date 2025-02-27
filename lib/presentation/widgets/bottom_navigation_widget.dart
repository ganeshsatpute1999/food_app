import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/home_screen/bloc/home_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavigationWidget(this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.orangeAccent.shade100,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        final homeBloc = context.read<HomeBloc>();

        homeBloc.add(ChangeTabEvent(index));

        // **Trigger Recipe Fetch when switching back to Home (index 0)**
        if (index == 0) {
          homeBloc.add(GetSimilarRecipeEvent());
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, size: 40),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_rounded, size: 40),
          label: 'Your Favorites',
        ),
      ],
    );
  }
}


