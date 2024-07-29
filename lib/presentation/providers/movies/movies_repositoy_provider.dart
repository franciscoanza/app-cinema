import 'package:cinema/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinema/infrastructure/repositories/movie_facade_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieFacadeyImpl(MoviedbDatasource());
});
