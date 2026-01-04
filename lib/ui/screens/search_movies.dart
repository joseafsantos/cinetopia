import '../../app/viewmodels/search_movies_viewmodel.dart';
import '/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(textController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/popular.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Filmes Populares",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: TextField(
                    controller: textController,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Pesquisar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: MovieCard(movie: viewmodel.moviesList[index]),
                ),
                itemCount: viewmodel.moviesList.length,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
