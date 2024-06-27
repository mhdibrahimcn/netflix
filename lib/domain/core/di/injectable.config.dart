// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/downloads/downloads_bloc.dart' as _i11;
import 'package:netflix/application/home/home_bloc.dart' as _i13;
import 'package:netflix/application/new&hot/new_and_hot_bloc.dart' as _i14;
import 'package:netflix/application/search/search_bloc.dart' as _i12;
import 'package:netflix/domain/downloads/i_downloads_repo.dart' as _i5;
import 'package:netflix/domain/home/home_service.dart' as _i9;
import 'package:netflix/domain/new&hot/hot_and_new_service.dart' as _i7;
import 'package:netflix/domain/search/search_service.dart' as _i3;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i6;
import 'package:netflix/infrastructure/home/home_Impl.dart' as _i10;
import 'package:netflix/infrastructure/new&hot/hot_and_new_impl.dart' as _i8;
import 'package:netflix/infrastructure/search/search_impl.dart' as _i4;

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
    gh.lazySingleton<_i3.SearchService>(() => _i4.SearchImpl());
    gh.lazySingleton<_i5.IDownloadsRepo>(() => _i6.DownloadsRepository());
    gh.lazySingleton<_i7.HotAndNewService>(() => _i8.HotAndNewServiceImpl());
    gh.lazySingleton<_i9.HomeService>(() => _i10.HomeBgImpl());
    gh.factory<_i11.DownloadsBloc>(
        () => _i11.DownloadsBloc(gh<_i5.IDownloadsRepo>()));
    gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
          gh<_i5.IDownloadsRepo>(),
          gh<_i3.SearchService>(),
        ));
    gh.factory<_i13.HomeBloc>(() => _i13.HomeBloc(
          gh<_i9.HomeService>(),
          gh<_i5.IDownloadsRepo>(),
        ));
    gh.factory<_i14.NewAndHotBloc>(
        () => _i14.NewAndHotBloc(gh<_i7.HotAndNewService>()));
    return this;
  }
}
