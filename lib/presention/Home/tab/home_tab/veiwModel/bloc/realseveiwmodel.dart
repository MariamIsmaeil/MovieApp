import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/use_case/realse_usecase.dart';

@injectable
class RealseViewModel extends Cubit<HomeTabsStates>{
  @factoryMethod
  RealseViewModel(this.RealsiseCase):super(HomeTabsInitialState());

  RealsUseCase RealsiseCase;

  GetRealse()async{
    emit(HomeTabsLoadingState());
    var result = await RealsiseCase.call();
    result.fold((c){
      emit(HomeTabsSuccessState(c));
    }, (error){
      emit(HomeTabsErrorState(error));
    });
  }
}

abstract class HomeTabsStates{}
class HomeTabsInitialState extends HomeTabsStates{}
class HomeTabsLoadingState extends HomeTabsStates{}
class HomeTabsSuccessState extends HomeTabsStates{
  List<Realserntity> c;
  HomeTabsSuccessState(this.c);
}
class HomeTabsErrorState extends HomeTabsStates{
  String error;
  HomeTabsErrorState(this.error);
}
