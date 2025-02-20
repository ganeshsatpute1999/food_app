import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/loginscreen/bloc/auth_bloc.dart';
import 'package:food_app/presentation/screen/loginscreen/login_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AuthBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
