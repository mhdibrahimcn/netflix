import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/new&hot/models/upcoming_movies/upcoming_movies.dart';

abstract class UpcomingMovieService {
  Future<Either<MainFailure, UpcomingMoviesModel>> getUpcomingMovieData();
}
