import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_faliure.freezed.dart';

@freezed
class MainFailure with _$MainFaliure {
  const factory MainFailure.clientFailure() = _ClientFailure;
  const factory MainFailure.serverFailure() = _ServerFailure;
}
