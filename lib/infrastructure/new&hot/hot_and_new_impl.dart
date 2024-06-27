import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/new&hot/hot_and_new_service.dart';
import 'package:netflix/domain/new&hot/models/everyone_watching/everyone_watching.dart';
import 'package:netflix/domain/new&hot/models/upcoming_movies/upcoming_movies.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewServiceImpl implements HotAndNewService {
  @override
  Future<Either<MainFailure, UpcomingMoviesModel>>
      getUpcomingMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.upcomingMovies,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = UpcomingMoviesModel.fromJson(response.data);

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
  Future<Either<MainFailure, EveryoneWatchingModel>>
      getEveryoneWatchingMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.everyoneWatching,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
        final result = EveryoneWatchingModel.fromJson(response.data);

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
