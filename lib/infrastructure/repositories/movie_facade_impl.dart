import 'package:cinema/domain/datasource/movies_datasource.dart';
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/domain/repositories/movies_facade.dart';

class MovieFacadeyImpl extends MoviesFacade {
  MovieFacadeyImpl(this.moviesDatasource);

  final MoviesDatasource moviesDatasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return moviesDatasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return moviesDatasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesDatasource.searchMovies(query);
  }
}
