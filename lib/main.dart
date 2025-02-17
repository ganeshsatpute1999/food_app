import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/homescreen/UI/home_screen.dart';
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<HomeBloc>(),
        child: HomeScreen(),
      ),
    );
  }
}
