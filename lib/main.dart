import 'package:flutter/material.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/login_screen/ui/login_screen.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

