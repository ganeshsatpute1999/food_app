import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';
import 'package:food_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:imagebutton/imagebutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetSimilarRecipeEvent());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ImageButton(
              width: 50,
              height: 45,
              onTap: () {},
              pressedImage: Image(
                width: 50,
                image: AssetImage('assets/images/avatar.png'),
              ),
              unpressedImage: Image(
                width: 50,
                image: AssetImage('assets/images/avatar.png'),
              ),
            ),
            Text("Home"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SimilarRecipeLoaded) {
            final similarRecipe = state.similarRecipe;

            if (similarRecipe.isEmpty) {
              return Center(
                child: Text('No Record Found'),
              );
            }

            return ListView.builder(
              itemCount: similarRecipe.length,
              itemBuilder: (context, index) {
                // ignore: no_leading_underscores_for_local_identifiers
                final _similarRecipe = similarRecipe[index];
                return ListTile(
                  title: Text('Recipe ID: ${_similarRecipe.id}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recipe Title: ${_similarRecipe.title}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is HomeFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return SizedBox();
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
