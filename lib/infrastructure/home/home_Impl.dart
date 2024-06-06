import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home_model.dart';

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
}
