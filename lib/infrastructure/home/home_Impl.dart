import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home_drama_genre_model/home_drama_genre_model.dart';
import 'package:netflix/domain/home/models/home_latest_model/home_latest_model.dart';
import 'package:netflix/domain/home/models/home_model.dart';
import 'package:netflix/domain/home/models/home_tv_shows_model/home_tv_shows_model.dart';

@LazySingleton(as: HomeService)
class HomeBgImpl implements HomeService {
  @override
  Future<Either<MainFailure, HomeBgModel>> homeBg() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeBg);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = HomeBgModel.fromJson(response.data);
        log(result.toString());
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HomeLatestModel>> homeLatest() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeLatestMovies);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = HomeLatestModel.fromJson(response.data);
        log(result.toString());
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HomeTvShowsModel>> getHomeTvShow() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeTvShows);
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = HomeTvShowsModel.fromJson(response.data);
        log(result.toString());
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HomeDramaGenreModel>> getHomeDramaGenre() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeDrama);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = HomeDramaGenreModel.fromJson(response.data);
        log(result.toString());
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
