import 'package:cinema/config/constans/environment.dart';
import 'package:cinema/domain/datasource/movies_datasource.dart';
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinema/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMoviedbKey,
      'language': 'es-MX',
    },
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final List<Movie> movies = MoviedbResponse.fromJson(json)
        .results
        .where((element) => element.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.moviedbToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie with $id not found');
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final response = await dio.get('/search/movie', queryParameters: {
      'query': query,
    });
    return _jsonToMovies(response.data);
  }
}
