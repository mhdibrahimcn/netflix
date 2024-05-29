import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_faliure.freezed.dart';

@freezed
class MainFaliure with _$MainFaliure {
  const factory MainFaliure.clientFaliure() = _ClientFaliure;
  const factory MainFaliure.serverFaliure() = _ServerFaliure;
}
