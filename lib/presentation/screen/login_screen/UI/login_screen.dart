import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/injection.dart';
import 'package:food_app/presentation/screen/home_screen/UI/home_screen.dart';
import 'package:food_app/presentation/screen/login_screen/bloc/login_bloc.dart';
import 'package:food_app/presentation/screen/sign_up_screen/UI/sign_up_screen.dart';
import 'package:food_app/presentation/widgets/login_button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginBloc>(),
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
                    "Welcome Back Foodie!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login to continue enjoying delicious meals",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.orange,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                state is LoginLoading
                                    ? const CircularProgressIndicator()
                                    : LoginButtonWidget(
                                        emailController: emailController,
                                        passwordController: passwordController,
                                      ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                        child: const Text(
                          'Create One...',
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
}








// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orangeAccent.shade100,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Icon(Icons.fastfood, size: 80, color: Colors.white),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Welcome Back Foodie!",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Login to continue enjoying delicious meals",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     // fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon:
//                               const Icon(Icons.email, color: Colors.orange),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       TextField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon:
//                               const Icon(Icons.lock, color: Colors.orange),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.orange,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(vertical: 14),
                      //     minimumSize: const Size(double.infinity, 50),
                      //   ),
                      //   onPressed: () {
                      //     final email = emailController.text.trim();
                      //     final password = passwordController.text.trim();

                      //     if (email.isNotEmpty && password.isNotEmpty) {
                      //       context.read<LoginBloc>().add(
                      //             LoginUserEvent(email, password),
                      //           );
                      //     }
                      //   },
                      //   child: const Text(
                      //     'Login',
                      //     style: TextStyle(fontSize: 18, color: Colors.white),
                      //   ),
                      // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Dont have an account?',
//                       style: TextStyle(fontSize: 17),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Create One...',
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                   ],
//                 ),
//                 BlocConsumer<LoginBloc, LoginState>(
//                   listener: (context, state) {
//                     if (state is LoginSuccess) {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomeScreen()),
//                       );
//                     } else if (state is LoginFailure) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(state.error)),
//                       );
//                     }
//                   },
//                   builder: (context, state) {
//                     if (state is LoginLoading) {
//                       return const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: CircularProgressIndicator(color: Colors.white),
//                       );
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
