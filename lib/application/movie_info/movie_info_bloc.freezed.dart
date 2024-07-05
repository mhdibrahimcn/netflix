// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieInfoEvent {
  int get movieId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int movieId) getMovieInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int movieId)? getMovieInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int movieId)? getMovieInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMovieInfo value) getMovieInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMovieInfo value)? getMovieInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMovieInfo value)? getMovieInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieInfoEventCopyWith<MovieInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieInfoEventCopyWith<$Res> {
  factory $MovieInfoEventCopyWith(
          MovieInfoEvent value, $Res Function(MovieInfoEvent) then) =
      _$MovieInfoEventCopyWithImpl<$Res, MovieInfoEvent>;
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class _$MovieInfoEventCopyWithImpl<$Res, $Val extends MovieInfoEvent>
    implements $MovieInfoEventCopyWith<$Res> {
  _$MovieInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_value.copyWith(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMovieInfoImplCopyWith<$Res>
    implements $MovieInfoEventCopyWith<$Res> {
  factory _$$GetMovieInfoImplCopyWith(
          _$GetMovieInfoImpl value, $Res Function(_$GetMovieInfoImpl) then) =
      __$$GetMovieInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class __$$GetMovieInfoImplCopyWithImpl<$Res>
    extends _$MovieInfoEventCopyWithImpl<$Res, _$GetMovieInfoImpl>
    implements _$$GetMovieInfoImplCopyWith<$Res> {
  __$$GetMovieInfoImplCopyWithImpl(
      _$GetMovieInfoImpl _value, $Res Function(_$GetMovieInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_$GetMovieInfoImpl(
      null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetMovieInfoImpl implements GetMovieInfo {
  const _$GetMovieInfoImpl(this.movieId);

  @override
  final int movieId;

  @override
  String toString() {
    return 'MovieInfoEvent.getMovieInfo(movieId: $movieId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMovieInfoImpl &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMovieInfoImplCopyWith<_$GetMovieInfoImpl> get copyWith =>
      __$$GetMovieInfoImplCopyWithImpl<_$GetMovieInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int movieId) getMovieInfo,
  }) {
    return getMovieInfo(movieId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int movieId)? getMovieInfo,
  }) {
    return getMovieInfo?.call(movieId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int movieId)? getMovieInfo,
    required TResult orElse(),
  }) {
    if (getMovieInfo != null) {
      return getMovieInfo(movieId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMovieInfo value) getMovieInfo,
  }) {
    return getMovieInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMovieInfo value)? getMovieInfo,
  }) {
    return getMovieInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMovieInfo value)? getMovieInfo,
    required TResult orElse(),
  }) {
    if (getMovieInfo != null) {
      return getMovieInfo(this);
    }
    return orElse();
  }
}

abstract class GetMovieInfo implements MovieInfoEvent {
  const factory GetMovieInfo(final int movieId) = _$GetMovieInfoImpl;

  @override
  int get movieId;
  @override
  @JsonKey(ignore: true)
  _$$GetMovieInfoImplCopyWith<_$GetMovieInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  MovieInfoModel? get movieInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieInfoStateCopyWith<MovieInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieInfoStateCopyWith<$Res> {
  factory $MovieInfoStateCopyWith(
          MovieInfoState value, $Res Function(MovieInfoState) then) =
      _$MovieInfoStateCopyWithImpl<$Res, MovieInfoState>;
  @useResult
  $Res call({bool isLoading, bool isError, MovieInfoModel? movieInfo});
}

/// @nodoc
class _$MovieInfoStateCopyWithImpl<$Res, $Val extends MovieInfoState>
    implements $MovieInfoStateCopyWith<$Res> {
  _$MovieInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? movieInfo = freezed,
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
      movieInfo: freezed == movieInfo
          ? _value.movieInfo
          : movieInfo // ignore: cast_nullable_to_non_nullable
              as MovieInfoModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieInfoStateImplCopyWith<$Res>
    implements $MovieInfoStateCopyWith<$Res> {
  factory _$$MovieInfoStateImplCopyWith(_$MovieInfoStateImpl value,
          $Res Function(_$MovieInfoStateImpl) then) =
      __$$MovieInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, MovieInfoModel? movieInfo});
}

/// @nodoc
class __$$MovieInfoStateImplCopyWithImpl<$Res>
    extends _$MovieInfoStateCopyWithImpl<$Res, _$MovieInfoStateImpl>
    implements _$$MovieInfoStateImplCopyWith<$Res> {
  __$$MovieInfoStateImplCopyWithImpl(
      _$MovieInfoStateImpl _value, $Res Function(_$MovieInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? movieInfo = freezed,
  }) {
    return _then(_$MovieInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      movieInfo: freezed == movieInfo
          ? _value.movieInfo
          : movieInfo // ignore: cast_nullable_to_non_nullable
              as MovieInfoModel?,
    ));
  }
}

/// @nodoc

class _$MovieInfoStateImpl implements _MovieInfoState {
  const _$MovieInfoStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.movieInfo});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final MovieInfoModel? movieInfo;

  @override
  String toString() {
    return 'MovieInfoState(isLoading: $isLoading, isError: $isError, movieInfo: $movieInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.movieInfo, movieInfo) ||
                other.movieInfo == movieInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, movieInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieInfoStateImplCopyWith<_$MovieInfoStateImpl> get copyWith =>
      __$$MovieInfoStateImplCopyWithImpl<_$MovieInfoStateImpl>(
          this, _$identity);
}

abstract class _MovieInfoState implements MovieInfoState {
  const factory _MovieInfoState(
      {required final bool isLoading,
      required final bool isError,
      required final MovieInfoModel? movieInfo}) = _$MovieInfoStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  MovieInfoModel? get movieInfo;
  @override
  @JsonKey(ignore: true)
  _$$MovieInfoStateImplCopyWith<_$MovieInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
