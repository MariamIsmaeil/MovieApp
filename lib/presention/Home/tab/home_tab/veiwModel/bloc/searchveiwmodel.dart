import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';
import 'package:movie_app/domain/use_case/discover_usecase.dart';
import 'package:movie_app/domain/use_case/search_usecase.dart';

@injectable
class SearchViewModel extends Cubit<HoomesTabStates>{
  @factoryMethod
  SearchViewModel(this.SearchuseCase):super(HoomesTabInitialState());

  SearchUseCase SearchuseCase;

  GetSearch(String text)async{
    print("kfk");
    emit(HoomesTabLoadingState());
    var result = await SearchuseCase.call(text);
    result.fold((categories){
      emit(HoomesTabSuccessState(categories));
    }, (error){
      emit(HoomesTabErrorState(error));
    });
  }
}

abstract class HoomesTabStates{}
class HoomesTabInitialState extends HoomesTabStates{}
class HoomesTabLoadingState extends HoomesTabStates{}
class HoomesTabSuccessState extends HoomesTabStates{
  List<Searchentity> categories;
  HoomesTabSuccessState(this.categories);
}
class HoomesTabErrorState extends HoomesTabStates{
  String error;
  HoomesTabErrorState(this.error);
}
