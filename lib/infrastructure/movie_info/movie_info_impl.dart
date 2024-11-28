import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/movie_info/models/movie_info_model/movie_info_model.dart';
import 'package:netflix/domain/movie_info/models/movie_video_model/movie_video_model.dart';
import 'package:netflix/domain/movie_info/movie_info_service.dart';
import 'package:netflix/infrastructure/api_key.dart';

@LazySingleton(as: MovieInfoService)
class MovieInfoImpl implements MovieInfoService {
  @override
  Future<Either<MainFailure, MovieInfoModel>> getMovieInfoData(
      int movieId) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get('${ApiEndPoints.movieInfoPage}$movieId?api_key=$apiKey');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieInfoModel.fromJson(response.data);
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
  Future<Either<MainFailure, MovieVideoModel>> getMovieVideoLink(
      int movieId) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get('${ApiEndPoints.movieInfoPage}$movieId/videos?api_key=$apiKey');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final videoModel = MovieVideoModel.fromJson(response.data);

        // Filter videos based on type (teaser or trailer)
        final filteredResults = videoModel.results
            .where((video) =>
                video.type?.toLowerCase() == 'teaser' ||
                video.type?.toLowerCase() == 'trailer')
            .toList();

        // Create a new MovieVideoModel instance with filtered results
        final filteredVideoModel = MovieVideoModel(results: filteredResults);

        return right(filteredVideoModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
