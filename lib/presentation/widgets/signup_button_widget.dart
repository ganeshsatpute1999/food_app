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
    required this.nameError,
    required this.emailError,
    required this.passwordError,
  });

  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final ValueNotifier<String?> nameError;
  final ValueNotifier<String?> emailError;
  final ValueNotifier<String?> passwordError;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        String email = emailController.text.trim();
        String name = nameController.text.trim();
        String password = passwordController.text.trim();

        bool isValid = true;

        // Name Validation
        if (name.isEmpty) {
          nameError.value = 'This field is required';
          isValid = false;
        } else {
          nameError.value = null;
        }

        // Email Validation
        if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
          emailError.value = 'Invalid email format';
          isValid = false;
        } else {
          emailError.value = null;
        }

        // Password Validation
        if (password.isEmpty || password.length < 6) {
          passwordError.value = 'Password must contain at least 6 characters';
          isValid = false;
        } else {
          passwordError.value = null;
        }

        if (!isValid) return;

        // Trigger Signup Event
        context.read<SignupBloc>().add(
              SignUpUserEvent({
                "email": email,
                "name": name,
                "password": password,
              }),
            );

        // Navigate to Login Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/presentation/screen/login_screen/UI/login_screen.dart';
// import 'package:food_app/presentation/screen/sign_up_screen/bloc/signup_bloc.dart';

// class SignupButtonWidget extends StatelessWidget {
//   const SignupButtonWidget({
//     super.key,
//     required this.emailController,
//     required this.nameController,
//     required this.passwordController,
//   });

//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final TextEditingController nameController;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.orange,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         minimumSize: const Size(double.infinity, 50),
//       ),
//       onPressed: () {
//         String email = emailController.text.trim();
//         String name = nameController.text.trim();
//         String password = passwordController.text.trim();

//         if (email.isEmpty || name.isEmpty || password.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('All fields are required!'),
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return; // Stop further execution
//         }

//         // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //     const SnackBar(
//         //       content: Text('Invalid email format!'),
//         //       duration: Duration(seconds: 2),
//         //       backgroundColor: Colors.red,
//         //     ),
//         //   );
//         //   return;
//         // }

//         if (password.length < 6) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Password must be atleast of 6 characters'),
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return;
//         }

//         context.read<SignupBloc>().add(
//               SignUpUserEvent({
//                 "email": email,
//                 "name": name,
//                 "password": password,
//               }),
//             );

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Account Created'),
//             duration: Duration(seconds: 2),
//             backgroundColor: Colors.green,
//           ),
//         );

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//       },
//       child: const Text(
//         "Sign Up",
//         style: TextStyle(fontSize: 18, color: Colors.white),
//       ),
//     );
//   }
// }
