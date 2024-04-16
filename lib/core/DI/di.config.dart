// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/discoverdata.dart' as _i4;
import '../../data/datasource_contract/genredata.dart' as _i6;
import '../../data/datasource_contract/populardata.dart' as _i18;
import '../../data/datasource_contract/realsedata.dart' as _i8;
import '../../data/datasource_contract/recommenddata.dart' as _i10;
import '../../data/datasource_contract/similardata.dart' as _i14;
import '../../data/datasource_imp/discoverdataimp.dart' as _i5;
import '../../data/datasource_imp/genredataimp.dart' as _i7;
import '../../data/datasource_imp/populardataimp.dart' as _i19;
import '../../data/datasource_imp/realsedataimp.dart' as _i9;
import '../../data/datasource_imp/recommenddataimp.dart' as _i11;
import '../../data/datasource_imp/similardataimp.dart' as _i15;
import '../../data/repo_imp/discover_repo_imp.dart' as _i21;
import '../../data/repo_imp/genre_repo_imp.dart' as _i25;
import '../../data/repo_imp/popular_repo_imp.dart' as _i29;
import '../../data/repo_imp/realse_repo_imp.dart' as _i33;
import '../../data/repo_imp/reco_repo_imp.dart' as _i35;
import '../../data/repo_imp/similar_repo_imp.dart' as _i17;
import '../../domain/repo_contract/discoverrepo.dart' as _i20;
import '../../domain/repo_contract/genrerepo.dart' as _i24;
import '../../domain/repo_contract/popular_repo.dart' as _i28;
import '../../domain/repo_contract/realserepo.dart' as _i32;
import '../../domain/repo_contract/recorepo.dart' as _i34;
import '../../domain/repo_contract/searchrepo.dart' as _i13;
import '../../domain/repo_contract/similarrepo.dart' as _i16;
import '../../domain/use_case/discover_usecase.dart' as _i22;
import '../../domain/use_case/genre_usecase.dart' as _i26;
import '../../domain/use_case/popular_usecase.dart' as _i30;
import '../../domain/use_case/realse_usecase.dart' as _i40;
import '../../domain/use_case/recomend_usecase.dart' as _i36;
import '../../domain/use_case/search_usecase.dart' as _i12;
import '../../domain/use_case/similar_usecase.dart' as _i38;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/discoverveiwmodel.dart'
    as _i23;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart'
    as _i27;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart'
    as _i31;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/realseveiwmodel.dart'
    as _i41;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart'
    as _i37;
import '../../presention/Home/tab/home_tab/veiwModel/bloc/similarbloc.dart'
    as _i39;
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
    gh.factory<_i4.Discoverdata>(
        () => _i5.Discoverdataimp(gh<_i3.ApiManager>()));
    gh.factory<_i6.Genredata>(() => _i7.Genredataimp(gh<_i3.ApiManager>()));
    gh.factory<_i8.Realsedata>(() => _i9.realsedataimp(gh<_i3.ApiManager>()));
    gh.factory<_i10.Recomenddata>(
        () => _i11.recomenddataimp(gh<_i3.ApiManager>()));
    gh.factory<_i12.SearchUseCase>(
        () => _i12.SearchUseCase(gh<_i13.SearchRepo>()));
    gh.factory<_i14.Similardata>(
        () => _i15.Smilardataimp(gh<_i3.ApiManager>()));
    gh.factory<_i16.Similarrepo>(
        () => _i17.SimilarRepoImp(gh<_i14.Similardata>()));
    gh.factory<_i18.populardata>(
        () => _i19.datapopularimp(gh<_i3.ApiManager>()));
    gh.factory<_i20.DiscoverRepo>(
        () => _i21.DiscoverRepoimp(gh<_i4.Discoverdata>()));
    gh.factory<_i22.DiscoverUseCase>(
        () => _i22.DiscoverUseCase(gh<_i20.DiscoverRepo>()));
    gh.factory<_i23.DiscoverViewModel>(
        () => _i23.DiscoverViewModel(gh<_i22.DiscoverUseCase>()));
    gh.factory<_i24.GenreRepo>(() => _i25.GenreRepoimp(gh<_i6.Genredata>()));
    gh.factory<_i26.GenreUseCase>(
        () => _i26.GenreUseCase(gh<_i24.GenreRepo>()));
    gh.factory<_i27.GenreViewModel>(
        () => _i27.GenreViewModel(gh<_i26.GenreUseCase>()));
    gh.factory<_i28.PopularRepo>(
        () => _i29.popularRepoimp(gh<_i18.populardata>()));
    gh.factory<_i30.PopularUseCase>(
        () => _i30.PopularUseCase(gh<_i28.PopularRepo>()));
    gh.factory<_i31.PopularViewModel>(
        () => _i31.PopularViewModel(gh<_i30.PopularUseCase>()));
    gh.factory<_i32.RealseRepo>(() => _i33.realseRepoimp(gh<_i8.Realsedata>()));
    gh.factory<_i34.RecoRepo>(() => _i35.recomRepoimp(gh<_i10.Recomenddata>()));
    gh.factory<_i36.RecoUseCase>(() => _i36.RecoUseCase(gh<_i34.RecoRepo>()));
    gh.factory<_i37.RecoViewModel>(
        () => _i37.RecoViewModel(gh<_i36.RecoUseCase>()));
    gh.factory<_i38.SimilarUsecase>(
        () => _i38.SimilarUsecase(gh<_i16.Similarrepo>()));
    gh.factory<_i39.SimilarVeiwModel>(
        () => _i39.SimilarVeiwModel(gh<_i38.SimilarUsecase>()));
    gh.factory<_i40.RealsUseCase>(
        () => _i40.RealsUseCase(gh<_i32.RealseRepo>()));
    gh.factory<_i41.RealseViewModel>(
        () => _i41.RealseViewModel(gh<_i40.RealsUseCase>()));
    return this;
  }
}
