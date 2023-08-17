import '../entities/movie.dart';

abstract class MoviesFacade {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
