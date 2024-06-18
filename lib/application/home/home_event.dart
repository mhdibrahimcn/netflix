part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.homeBg() = HomeBg;
  const factory HomeEvent.homeLatest() = HomeLatest;
  const factory HomeEvent.changeCarouselIndex(int index) = ChangeCarouselIndex;
}
