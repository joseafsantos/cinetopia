import '../models/movie.dart';
import '../services/search_movies_service.dart';

class ReleasesViewmodel {
  List<Movie> _moviesList = [];

  Future<List<Movie>> getUpcomingMovies() async {
    final SearchMoviesService searchForUpcomingMovies =
        SearchForUpcomingMovies();
    return _moviesList = await searchForUpcomingMovies.getMovies();
  }

  List get moviesList => _moviesList;
}
