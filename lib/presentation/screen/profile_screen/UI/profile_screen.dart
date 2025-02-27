import 'package:flutter/material.dart';
import 'package:food_app/presentation/screen/favorites_screen/UI/favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  radius: 40,
                ),
                SizedBox(width: 20),
                Text(
                  'Hrishikesh Kedar',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ListTile(
                title: Card(
                  color: const Color.fromARGB(255, 255, 250, 209),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.account_box_rounded, color: Colors.orange),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hrishikesh'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Card(
                color: const Color.fromARGB(255, 255, 250, 209),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.orange),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('hrishikeshkedar@gmail.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => FavoritesScreen(num: 1),
                  ),
                );
              },
              title: Card(
                color: const Color.fromARGB(255, 255, 250, 209),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_rounded, color: Colors.orange),
                      SizedBox(width: 20),
                      Text(
                        'Your Favorites',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
