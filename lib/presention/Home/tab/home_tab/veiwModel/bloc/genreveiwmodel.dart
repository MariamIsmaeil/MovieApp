import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';
import 'package:movie_app/domain/use_case/genre_usecase.dart';

@injectable
class GenreViewModel extends Cubit<aHomeTabStates>{
  @factoryMethod
  GenreViewModel(this.GenrUseCase):super(aHomeTabInitialState());

  GenreUseCase GenrUseCase;

  GetGenre()async{
    print("kfk");
    emit(aHomeTabLoadingState());
    var result = await GenrUseCase.call();
    result.fold((categories){
      emit(aHomeTabSuccessState(categories));
    }, (error){
      emit(aHomeTabErrorState(error));
    });
  }
}

abstract class aHomeTabStates{}
class aHomeTabInitialState extends aHomeTabStates{}
class aHomeTabLoadingState extends aHomeTabStates{}
class aHomeTabSuccessState extends aHomeTabStates{
  List<Genreentity> categories;
  aHomeTabSuccessState(this.categories);
}
class aHomeTabErrorState extends aHomeTabStates{
  String error;
  aHomeTabErrorState(this.error);
}
