import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/movie_info/models/movie_info_model/movie_info_model.dart';
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
        // log(response.data.toString());

        // log("downloadlist${downloadsList.toString()}");
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
}
