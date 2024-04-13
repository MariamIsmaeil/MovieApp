import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';
import 'package:movie_app/domain/use_case/popular_usecase.dart';

@injectable
class PopularViewModel extends Cubit<HomeTabStates>{
  @factoryMethod
  PopularViewModel(this.popularUseCase):super(HomeTabInitialState());

  PopularUseCase popularUseCase;

  GetPopular()async{
    print("kfk");
    emit(HomeTabLoadingState());
    var result = await popularUseCase.call();
    result.fold((categories){
      emit(HomeTabSuccessState(categories));
    }, (error){
      emit(HomeTabErrorState(error));
    });
  }
}

abstract class HomeTabStates{}
class HomeTabInitialState extends HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{}
class HomeTabSuccessState extends HomeTabStates{
  List<Popularentity> categories;
  HomeTabSuccessState(this.categories);
}
class HomeTabErrorState extends HomeTabStates{
  String error;
  HomeTabErrorState(this.error);
}
