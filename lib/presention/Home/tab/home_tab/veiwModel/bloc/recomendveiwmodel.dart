import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';
import 'package:movie_app/domain/use_case/recomend_usecase.dart';

@injectable
class RecoViewModel extends Cubit<HomeStates>{
  @factoryMethod
  RecoViewModel(this.RecoCase):super(HomeInitialState());

  RecoUseCase RecoCase;

  GetReco()async{
    emit(HomeLoadingState());
    var result = await RecoCase.call();
    result.fold((c){
      emit(HomeSuccessState(c));
    }, (error){
      emit(HomeErrorState(error));
    });
  }
}

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSuccessState extends HomeStates{
  List<Recomendentity> cat;
  HomeSuccessState(this.cat);
}
class HomeErrorState extends HomeStates{
  String error;
  HomeErrorState(this.error);
}
