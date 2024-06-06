import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:netflix/domain/home/models/home_model.dart';

abstract class HomeService {
  Future<Either<MainFailure, HomeBgModel>> homeBg();
}
