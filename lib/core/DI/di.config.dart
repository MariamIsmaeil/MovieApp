// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/populardata.dart' as _i8;
import '../../data/datasource_contract/realsedata.dart' as _i4;
import '../../data/datasource_contract/recommenddata.dart' as _i6;
import '../../data/datasource_imp/populardataimp.dart' as _i9;
import '../../data/datasource_imp/realsedataimp.dart' as _i5;
import '../../data/datasource_imp/recommenddataimp.dart' as _i7;
import '../../data/repo_imp/popular_repo_imp.dart' as _i11;
import '../../data/repo_imp/realse_repo_imp.dart' as _i15;
import '../../data/repo_imp/reco_repo_imp.dart' as _i17;
import '../../domain/repo_contract/popular_repo.dart' as _i10;
import '../../domain/repo_contract/realserepo.dart' as _i14;
import '../../domain/repo_contract/recorepo.dart' as _i16;
import '../../domain/use_case/popular_usecase.dart' as _i12;
import '../../domain/use_case/realse_usecase.dart' as _i20;
import '../../domain/use_case/recomend_usecase.dart' as _i18;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart'
    as _i13;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/realseveiwmodel.dart'
    as _i21;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart'
    as _i19;
import '../api/api_manager.dart' as _i3;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.Realsedata>(() => _i5.realsedataimp(gh<_i3.ApiManager>()));
    gh.factory<_i6.Recomenddata>(
        () => _i7.recomenddataimp(gh<_i3.ApiManager>()));
    gh.factory<_i8.populardata>(() => _i9.datapopularimp(gh<_i3.ApiManager>()));
    gh.factory<_i10.PopularRepo>(
        () => _i11.popularRepoimp(gh<_i8.populardata>()));
    gh.factory<_i12.PopularUseCase>(
        () => _i12.PopularUseCase(gh<_i10.PopularRepo>()));
    gh.factory<_i13.PopularViewModel>(
        () => _i13.PopularViewModel(gh<_i12.PopularUseCase>()));
    gh.factory<_i14.RealseRepo>(() => _i15.realseRepoimp(gh<_i4.Realsedata>()));
    gh.factory<_i16.RecoRepo>(() => _i17.recomRepoimp(gh<_i6.Recomenddata>()));
    gh.factory<_i18.RecoUseCase>(() => _i18.RecoUseCase(gh<_i16.RecoRepo>()));
    gh.factory<_i19.RecoViewModel>(
        () => _i19.RecoViewModel(gh<_i18.RecoUseCase>()));
    gh.factory<_i20.RealsUseCase>(
        () => _i20.RealsUseCase(gh<_i14.RealseRepo>()));
    gh.factory<_i21.RealseViewModel>(
        () => _i21.RealseViewModel(gh<_i20.RealsUseCase>()));
    return this;
  }
}
