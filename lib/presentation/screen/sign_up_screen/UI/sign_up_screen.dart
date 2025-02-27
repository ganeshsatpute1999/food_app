import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/login_screen/ui/login_screen.dart';
import 'package:food_app/presentation/screen/sign_up_screen/bloc/signup_bloc.dart';
import 'package:food_app/presentation/widgets/signup_button_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<String?> nameError = ValueNotifier(null);
  final ValueNotifier<String?> emailError = ValueNotifier(null);
  final ValueNotifier<String?> passwordError = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SignupBloc>(),
      child: Scaffold(
        backgroundColor: Colors.orangeAccent.shade100,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.fastfood, size: 80, color: Colors.white),
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome Foodie!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Create your account and grab delicious meals now",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _buildTextField(
                            controller: nameController,
                            label: 'Name',
                            errorNotifier: nameError),
                        const SizedBox(height: 10),
                        _buildTextField(
                            controller: emailController,
                            label: 'Email',
                            errorNotifier: emailError),
                        const SizedBox(height: 10),
                        _buildTextField(
                            controller: passwordController,
                            label: 'Password',
                            errorNotifier: passwordError,
                            obscureText: true),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SignupButtonWidget(
                    emailController: emailController,
                    nameController: nameController,
                    passwordController: passwordController,
                    nameError: nameError,
                    emailError: emailError,
                    passwordError: passwordError,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                        child: const Text(
                          'Login...',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required ValueNotifier<String?> errorNotifier,
    bool obscureText = false,
  }) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, errorText, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorText == null ? Colors.grey : Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorText == null ? Colors.blue : Colors.red),
                ),
                errorText: errorText,
              ),
            ),
          ],
        );
      },
    );
  }
}


// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => locator<SignupBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.orangeAccent.shade100,
//         body: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.fastfood, size: 80, color: Colors.white),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Welcome Foodie!",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     "Create your account and grab delicious meals now",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       // fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: emailController,
//                           decoration: const InputDecoration(labelText: 'Email'),
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           controller: nameController,
//                           decoration: const InputDecoration(labelText: 'Name'),
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           controller: passwordController,
//                           decoration:
//                               const InputDecoration(labelText: 'Password'),
//                           obscureText: true,
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   BlocConsumer<SignupBloc, SignupState>(
//                     listener: (context, state) {
//                       if (state is SignupSuccess) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text('User signed up successfully')),
//                         );
//                       } else if (state is SignupError) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(state.message)),
//                         );
//                       }
//                     },
//                     builder: (context, state) {
//                       return Column(
//                         children: [
//                           state is SignupLoading
//                               ? const CircularProgressIndicator()
//                               : ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.orange,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 14),
//                                     minimumSize:
//                                         const Size(double.infinity, 50),
//                                   ),
//                                   onPressed: () {
//                                     final user = {
//                                       "email": emailController.text.trim(),
//                                       "name": nameController.text.trim(),
//                                       "password":
//                                           passwordController.text.trim(),
//                                     };

//                                     if (user["email"]!.isNotEmpty &&
//                                         user["name"]!.isNotEmpty &&
//                                         user["password"]!.isNotEmpty) {
//                                       context
//                                           .read<SignupBloc>()
//                                           .add(SignUpUserEvent(user));
//                                     } else {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                             content: Text(
//                                                 "Please fill in all fields")),
//                                       );
//                                     }
//                                   },
//                                   child: const Text(
//                                     "Sign Up",
//                                     style: TextStyle(
//                                         fontSize: 18, color: Colors.white),
//                                   ),
//                                 ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Already have an account?',
//                                 style: TextStyle(fontSize: 17),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Login...',
//                                   style: TextStyle(fontSize: 17),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
