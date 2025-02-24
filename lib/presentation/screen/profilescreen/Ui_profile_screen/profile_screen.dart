// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/presentation/widgets/bottom_navigation_bar_widget.dart';
// import '../../bloc/profile/profile_bloc.dart';
// import '../../bloc/profile/profile_event.dart';
// import '../../bloc/profile/profile_state.dart';
// import '../../widgets/bottom_navigation_bar_widget.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProfileBloc(locator<GetProfile>())..add(LoadProfile()),
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Profile")),
//         body: BlocBuilder<ProfileBloc, ProfileState>(
//           builder: (context, state) {
//             if (state is ProfileLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is ProfileLoaded) {
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(state.profile.avatarUrl),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       state.profile.name,
//                       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       state.profile.email,
//                       style: const TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is ProfileError) {
//               return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
//             }
//             return const SizedBox();
//           },
//         ),
//         bottomNavigationBar: const BottomNavigationBarWidget(),
//       ),
//     );
//   }
// }
