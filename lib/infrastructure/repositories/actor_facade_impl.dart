import 'package:cinema/domain/datasource/actors_datasource.dart';
import 'package:cinema/domain/entities/actor.dart';
import 'package:cinema/domain/repositories/actors_facade.dart';

class ActorFacadeImpl extends ActorsFacade {
  final ActorsDatasource datasource;
  ActorFacadeImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId: movieId);
  }
}
