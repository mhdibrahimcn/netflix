import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/new&hot/models/everyone_watching/everyone_watching.dart';
import 'package:netflix/domain/new&hot/models/upcoming_movies/upcoming_movies.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, UpcomingMoviesModel>> getUpcomingMovieData();
  Future<Either<MainFailure, EveryoneWatchingModel>>
      getEveryoneWatchingMovieData();
}
