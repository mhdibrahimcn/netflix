import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/movie_info/models/movie_info_model/movie_info_model.dart';
import 'package:netflix/domain/movie_info/models/movie_video_model/movie_video_model.dart';

abstract class MovieInfoService {
  Future<Either<MainFailure, MovieInfoModel>> getMovieInfoData(int movieId);
  Future<Either<MainFailure, MovieVideoModel>> getMovieVideoLink(int movieId);
}
