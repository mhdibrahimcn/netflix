import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/faliures/main_faliure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFaliure, List<Downloads>>> getDownloadsImage();
}
