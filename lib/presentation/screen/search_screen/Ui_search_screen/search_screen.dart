import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screen/search_screen/bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Recipes")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<SearchBloc>().add(SearchRecipesEvent(query));
                }
              },
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SearchLoadedState) {
                  return ListView.builder(
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(state.recipes[index].image,
                            width: 50, height: 50),
                        title: Text(state.recipes[index].title),
                      );
                    },
                  );
                } else if (state is SearchErrorState) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text("Search for recipes"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
