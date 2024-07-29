import 'package:cinema/config/constans/environment.dart';
import 'package:cinema/domain/datasource/actors_datasource.dart';
import 'package:cinema/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/actor.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMoviedbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie({required String movieId}) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
