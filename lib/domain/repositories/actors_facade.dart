import 'package:cinema/domain/entities/actor.dart';

abstract class ActorsFacade {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
