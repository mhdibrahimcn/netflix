// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeLatest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? homeLatest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeLatest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLatest value) homeLatest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLatest value)? homeLatest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLatest value)? homeLatest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeLatestImplCopyWith<$Res> {
  factory _$$HomeLatestImplCopyWith(
          _$HomeLatestImpl value, $Res Function(_$HomeLatestImpl) then) =
      __$$HomeLatestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLatestImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeLatestImpl>
    implements _$$HomeLatestImplCopyWith<$Res> {
  __$$HomeLatestImplCopyWithImpl(
      _$HomeLatestImpl _value, $Res Function(_$HomeLatestImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeLatestImpl implements HomeLatest {
  const _$HomeLatestImpl();

  @override
  String toString() {
    return 'HomeEvent.homeLatest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLatestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeLatest,
  }) {
    return homeLatest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? homeLatest,
  }) {
    return homeLatest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeLatest,
    required TResult orElse(),
  }) {
    if (homeLatest != null) {
      return homeLatest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLatest value) homeLatest,
  }) {
    return homeLatest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLatest value)? homeLatest,
  }) {
    return homeLatest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLatest value)? homeLatest,
    required TResult orElse(),
  }) {
    if (homeLatest != null) {
      return homeLatest(this);
    }
    return orElse();
  }
}

abstract class HomeLatest implements HomeEvent {
  const factory HomeLatest() = _$HomeLatestImpl;
}

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<HomeResultData> get homeResultList => throw _privateConstructorUsedError;
  List<HomeLatestResultData> get homeLatestList =>
      throw _privateConstructorUsedError;
  List<Downloads> get homeTrendingList => throw _privateConstructorUsedError;
  List<HomeDramaGenreResult> get homeDramaGenreList =>
      throw _privateConstructorUsedError;
  List<HomeTvShowResult> get homeTvShowList =>
      throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<HomeResultData> homeResultList,
      List<HomeLatestResultData> homeLatestList,
      List<Downloads> homeTrendingList,
      List<HomeDramaGenreResult> homeDramaGenreList,
      List<HomeTvShowResult> homeTvShowList,
      int currentIndex});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? homeResultList = null,
    Object? homeLatestList = null,
    Object? homeTrendingList = null,
    Object? homeDramaGenreList = null,
    Object? homeTvShowList = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      homeResultList: null == homeResultList
          ? _value.homeResultList
          : homeResultList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      homeLatestList: null == homeLatestList
          ? _value.homeLatestList
          : homeLatestList // ignore: cast_nullable_to_non_nullable
              as List<HomeLatestResultData>,
      homeTrendingList: null == homeTrendingList
          ? _value.homeTrendingList
          : homeTrendingList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      homeDramaGenreList: null == homeDramaGenreList
          ? _value.homeDramaGenreList
          : homeDramaGenreList // ignore: cast_nullable_to_non_nullable
              as List<HomeDramaGenreResult>,
      homeTvShowList: null == homeTvShowList
          ? _value.homeTvShowList
          : homeTvShowList // ignore: cast_nullable_to_non_nullable
              as List<HomeTvShowResult>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<HomeResultData> homeResultList,
      List<HomeLatestResultData> homeLatestList,
      List<Downloads> homeTrendingList,
      List<HomeDramaGenreResult> homeDramaGenreList,
      List<HomeTvShowResult> homeTvShowList,
      int currentIndex});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? homeResultList = null,
    Object? homeLatestList = null,
    Object? homeTrendingList = null,
    Object? homeDramaGenreList = null,
    Object? homeTvShowList = null,
    Object? currentIndex = null,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      homeResultList: null == homeResultList
          ? _value._homeResultList
          : homeResultList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      homeLatestList: null == homeLatestList
          ? _value._homeLatestList
          : homeLatestList // ignore: cast_nullable_to_non_nullable
              as List<HomeLatestResultData>,
      homeTrendingList: null == homeTrendingList
          ? _value._homeTrendingList
          : homeTrendingList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      homeDramaGenreList: null == homeDramaGenreList
          ? _value._homeDramaGenreList
          : homeDramaGenreList // ignore: cast_nullable_to_non_nullable
              as List<HomeDramaGenreResult>,
      homeTvShowList: null == homeTvShowList
          ? _value._homeTvShowList
          : homeTvShowList // ignore: cast_nullable_to_non_nullable
              as List<HomeTvShowResult>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.isLoading,
      required this.isError,
      required final List<HomeResultData> homeResultList,
      required final List<HomeLatestResultData> homeLatestList,
      required final List<Downloads> homeTrendingList,
      required final List<HomeDramaGenreResult> homeDramaGenreList,
      required final List<HomeTvShowResult> homeTvShowList,
      required this.currentIndex})
      : _homeResultList = homeResultList,
        _homeLatestList = homeLatestList,
        _homeTrendingList = homeTrendingList,
        _homeDramaGenreList = homeDramaGenreList,
        _homeTvShowList = homeTvShowList;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<HomeResultData> _homeResultList;
  @override
  List<HomeResultData> get homeResultList {
    if (_homeResultList is EqualUnmodifiableListView) return _homeResultList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeResultList);
  }

  final List<HomeLatestResultData> _homeLatestList;
  @override
  List<HomeLatestResultData> get homeLatestList {
    if (_homeLatestList is EqualUnmodifiableListView) return _homeLatestList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeLatestList);
  }

  final List<Downloads> _homeTrendingList;
  @override
  List<Downloads> get homeTrendingList {
    if (_homeTrendingList is EqualUnmodifiableListView)
      return _homeTrendingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeTrendingList);
  }

  final List<HomeDramaGenreResult> _homeDramaGenreList;
  @override
  List<HomeDramaGenreResult> get homeDramaGenreList {
    if (_homeDramaGenreList is EqualUnmodifiableListView)
      return _homeDramaGenreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeDramaGenreList);
  }

  final List<HomeTvShowResult> _homeTvShowList;
  @override
  List<HomeTvShowResult> get homeTvShowList {
    if (_homeTvShowList is EqualUnmodifiableListView) return _homeTvShowList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeTvShowList);
  }

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isError: $isError, homeResultList: $homeResultList, homeLatestList: $homeLatestList, homeTrendingList: $homeTrendingList, homeDramaGenreList: $homeDramaGenreList, homeTvShowList: $homeTvShowList, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._homeResultList, _homeResultList) &&
            const DeepCollectionEquality()
                .equals(other._homeLatestList, _homeLatestList) &&
            const DeepCollectionEquality()
                .equals(other._homeTrendingList, _homeTrendingList) &&
            const DeepCollectionEquality()
                .equals(other._homeDramaGenreList, _homeDramaGenreList) &&
            const DeepCollectionEquality()
                .equals(other._homeTvShowList, _homeTvShowList) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      const DeepCollectionEquality().hash(_homeResultList),
      const DeepCollectionEquality().hash(_homeLatestList),
      const DeepCollectionEquality().hash(_homeTrendingList),
      const DeepCollectionEquality().hash(_homeDramaGenreList),
      const DeepCollectionEquality().hash(_homeTvShowList),
      currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool isLoading,
      required final bool isError,
      required final List<HomeResultData> homeResultList,
      required final List<HomeLatestResultData> homeLatestList,
      required final List<Downloads> homeTrendingList,
      required final List<HomeDramaGenreResult> homeDramaGenreList,
      required final List<HomeTvShowResult> homeTvShowList,
      required final int currentIndex}) = _$HomeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<HomeResultData> get homeResultList;
  @override
  List<HomeLatestResultData> get homeLatestList;
  @override
  List<Downloads> get homeTrendingList;
  @override
  List<HomeDramaGenreResult> get homeDramaGenreList;
  @override
  List<HomeTvShowResult> get homeTvShowList;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
