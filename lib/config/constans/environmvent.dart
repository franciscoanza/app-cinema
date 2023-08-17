import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environvent {
  static String hheMoviedbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'NO HAY APY KEY';
}
