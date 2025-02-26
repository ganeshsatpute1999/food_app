import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/login_screen/UI/login_screen.dart';
import 'package:food_app/presentation/screen/sign_up_screen/bloc/signup_bloc.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        context.read<SignupBloc>().add(SignUpUserEvent({
              "email": emailController.text.trim(),
              "name": nameController.text.trim(),
              "password": passwordController.text.trim(),
            }));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
