import '../entities/movie.dart';

abstract class LocalStorageFacade {
  Future<void> toggleFav(Movie movie);
  Future<bool> isFav(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
