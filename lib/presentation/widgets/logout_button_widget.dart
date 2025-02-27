import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/login_screen/UI/login_screen.dart';
import 'package:food_app/presentation/screen/login_screen/bloc/login_bloc.dart';

class LogoutButtonWidget extends StatelessWidget{
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => LoginScreen()),
              );
              context.read<LoginBloc>().add(
                    LogoutEvent(),
                  ); // Dispatch Logout
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          );
  }
}