import 'package:cinema/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFav(Movie movie);
  Future<bool> isFav(int movieid);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
