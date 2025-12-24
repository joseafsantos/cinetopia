import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/popular.png"),
          Text("Filmes Populares"),
          Text("Search Bar"),
          Row(
            children: [
              Image.asset("assets/images/upcoming.png"),
              Column(children: [Text("Titulo do Filme"), Text("Info Filme")]),
            ],
          ),
        ],
      ),
    );
  }
}
