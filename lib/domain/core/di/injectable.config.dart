// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/downloads/downloads_bloc.dart' as _i13;
import 'package:netflix/application/home/home_bloc.dart' as _i16;
import 'package:netflix/application/movie_info/movie_info_bloc.dart' as _i14;
import 'package:netflix/application/new&hot/new_and_hot_bloc.dart' as _i17;
import 'package:netflix/application/search/search_bloc.dart' as _i15;
import 'package:netflix/domain/downloads/i_downloads_repo.dart' as _i7;
import 'package:netflix/domain/home/home_service.dart' as _i11;
import 'package:netflix/domain/movie_info/movie_info_service.dart' as _i3;
import 'package:netflix/domain/new&hot/hot_and_new_service.dart' as _i9;
import 'package:netflix/domain/search/search_service.dart' as _i5;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i8;
import 'package:netflix/infrastructure/home/home_Impl.dart' as _i12;
import 'package:netflix/infrastructure/movie_info/movie_info_impl.dart' as _i4;
import 'package:netflix/infrastructure/new&hot/hot_and_new_impl.dart' as _i10;
import 'package:netflix/infrastructure/search/search_impl.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.MovieInfoService>(() => _i4.MovieInfoImpl());
    gh.lazySingleton<_i5.SearchService>(() => _i6.SearchImpl());
    gh.lazySingleton<_i7.IDownloadsRepo>(() => _i8.DownloadsRepository());
    gh.lazySingleton<_i9.HotAndNewService>(() => _i10.HotAndNewServiceImpl());
    gh.lazySingleton<_i11.HomeService>(() => _i12.HomeBgImpl());
    gh.factory<_i13.DownloadsBloc>(
        () => _i13.DownloadsBloc(gh<_i7.IDownloadsRepo>()));
    gh.factory<_i14.MovieInfoBloc>(
        () => _i14.MovieInfoBloc(gh<_i3.MovieInfoService>()));
    gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(
          gh<_i7.IDownloadsRepo>(),
          gh<_i5.SearchService>(),
        ));
    gh.factory<_i16.HomeBloc>(() => _i16.HomeBloc(
          gh<_i11.HomeService>(),
          gh<_i7.IDownloadsRepo>(),
        ));
    gh.factory<_i17.NewAndHotBloc>(
        () => _i17.NewAndHotBloc(gh<_i9.HotAndNewService>()));
    return this;
  }
}
