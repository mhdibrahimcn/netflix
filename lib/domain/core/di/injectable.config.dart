// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/downloads/downloads_bloc.dart' as _i7;
import 'package:netflix/application/search/search_bloc.dart' as _i8;
import 'package:netflix/domain/downloads/i_downloads_repo.dart' as _i5;
import 'package:netflix/domain/search/search_service.dart' as _i3;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i6;
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
    gh.factory<_i7.DownloadsBloc>(
        () => _i7.DownloadsBloc(gh<_i5.IDownloadsRepo>()));
    gh.factory<_i8.SearchBloc>(() => _i8.SearchBloc(
          gh<_i5.IDownloadsRepo>(),
          gh<_i3.SearchService>(),
        ));
    return this;
  }
}
