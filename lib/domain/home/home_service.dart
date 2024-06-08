import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/home/models/home_drama_genre_model/home_drama_genre_model.dart';
import 'package:netflix/domain/home/models/home_latest_model/home_latest_model.dart';

import 'package:netflix/domain/home/models/home_model.dart';
import 'package:netflix/domain/home/models/home_tv_shows_model/home_tv_shows_model.dart';

abstract class HomeService {
  Future<Either<MainFailure, HomeBgModel>> homeBg();
  Future<Either<MainFailure, HomeLatestModel>> homeLatest();
  Future<Either<MainFailure, HomeTvShowsModel>> getHomeTvShow();
  Future<Either<MainFailure, HomeDramaGenreModel>> getHomeDramaGenre();
}
