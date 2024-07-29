import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovie}) : super({});
  final GetMovieCallBack getMovie;

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
