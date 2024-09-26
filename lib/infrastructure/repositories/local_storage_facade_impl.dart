import 'package:cinema/domain/datasource/local_storage_datasource.dart';
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/domain/repositories/local_storage_facade.dart';

class LocalStorageFacadeImpl extends LocalStorageFacade {
  final LocalStorageDatasource datasource;

  LocalStorageFacadeImpl({required this.datasource});

  @override
  Future<bool> isFav(int movieId) {
    return datasource.isFav(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFav(Movie movie) {
    return datasource.toggleFav(movie);
  }
}
