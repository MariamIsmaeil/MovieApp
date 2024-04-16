// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/genredata.dart' as _i4;
import '../../data/datasource_contract/populardata.dart' as _i16;
import '../../data/datasource_contract/realsedata.dart' as _i6;
import '../../data/datasource_contract/recommenddata.dart' as _i8;
import '../../data/datasource_contract/similardata.dart' as _i12;
import '../../data/datasource_imp/genredataimp.dart' as _i5;
import '../../data/datasource_imp/populardataimp.dart' as _i17;
import '../../data/datasource_imp/realsedataimp.dart' as _i7;
import '../../data/datasource_imp/recommenddataimp.dart' as _i9;
import '../../data/datasource_imp/similardataimp.dart' as _i13;
import '../../data/repo_imp/genre_repo_imp.dart' as _i19;
import '../../data/repo_imp/popular_repo_imp.dart' as _i23;
import '../../data/repo_imp/realse_repo_imp.dart' as _i27;
import '../../data/repo_imp/reco_repo_imp.dart' as _i29;
import '../../data/repo_imp/similar_repo_imp.dart' as _i15;
import '../../domain/repo_contract/genrerepo.dart' as _i18;
import '../../domain/repo_contract/popular_repo.dart' as _i22;
import '../../domain/repo_contract/realserepo.dart' as _i26;
import '../../domain/repo_contract/recorepo.dart' as _i28;
import '../../domain/repo_contract/searchrepo.dart' as _i11;
import '../../domain/repo_contract/similarrepo.dart' as _i14;
import '../../domain/use_case/genre_usecase.dart' as _i20;
import '../../domain/use_case/popular_usecase.dart' as _i24;
import '../../domain/use_case/realse_usecase.dart' as _i34;
import '../../domain/use_case/recomend_usecase.dart' as _i30;
import '../../domain/use_case/search_usecase.dart' as _i10;
import '../../domain/use_case/similar_usecase.dart' as _i32;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart'
    as _i21;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart'
    as _i25;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/realseveiwmodel.dart'
    as _i35;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart'
    as _i31;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/similarbloc.dart'
    as _i33;
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
    gh.factory<_i4.Genredata>(() => _i5.Genredataimp(gh<_i3.ApiManager>()));
    gh.factory<_i6.Realsedata>(() => _i7.realsedataimp(gh<_i3.ApiManager>()));
    gh.factory<_i8.Recomenddata>(
        () => _i9.recomenddataimp(gh<_i3.ApiManager>()));
    gh.factory<_i10.SearchUseCase>(
        () => _i10.SearchUseCase(gh<_i11.SearchRepo>()));
    gh.factory<_i12.Similardata>(
        () => _i13.Smilardataimp(gh<_i3.ApiManager>()));
    gh.factory<_i14.Similarrepo>(
        () => _i15.SimilarRepoImp(gh<_i12.Similardata>()));
    gh.factory<_i16.populardata>(
        () => _i17.datapopularimp(gh<_i3.ApiManager>()));
    gh.factory<_i18.GenreRepo>(() => _i19.GenreRepoimp(gh<_i4.Genredata>()));
    gh.factory<_i20.GenreUseCase>(
        () => _i20.GenreUseCase(gh<_i18.GenreRepo>()));
    gh.factory<_i21.GenreViewModel>(
        () => _i21.GenreViewModel(gh<_i20.GenreUseCase>()));
    gh.factory<_i22.PopularRepo>(
        () => _i23.popularRepoimp(gh<_i16.populardata>()));
    gh.factory<_i24.PopularUseCase>(
        () => _i24.PopularUseCase(gh<_i22.PopularRepo>()));
    gh.factory<_i25.PopularViewModel>(
        () => _i25.PopularViewModel(gh<_i24.PopularUseCase>()));
    gh.factory<_i26.RealseRepo>(() => _i27.realseRepoimp(gh<_i6.Realsedata>()));
    gh.factory<_i28.RecoRepo>(() => _i29.recomRepoimp(gh<_i8.Recomenddata>()));
    gh.factory<_i30.RecoUseCase>(() => _i30.RecoUseCase(gh<_i28.RecoRepo>()));
    gh.factory<_i31.RecoViewModel>(
        () => _i31.RecoViewModel(gh<_i30.RecoUseCase>()));
    gh.factory<_i32.SimilarUsecase>(
        () => _i32.SimilarUsecase(gh<_i14.Similarrepo>()));
    gh.factory<_i33.SimilarVeiwModel>(
        () => _i33.SimilarVeiwModel(gh<_i32.SimilarUsecase>()));
    gh.factory<_i34.RealsUseCase>(
        () => _i34.RealsUseCase(gh<_i26.RealseRepo>()));
    gh.factory<_i35.RealseViewModel>(
        () => _i35.RealseViewModel(gh<_i34.RealsUseCase>()));
    return this;
  }
}
