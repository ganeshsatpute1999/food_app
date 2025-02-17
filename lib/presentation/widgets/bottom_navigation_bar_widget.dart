import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            size: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_rounded,
            size: 40,
          ),
          label: 'Your Collection',
        ),
      ],
    );
  }
}
