import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';
import 'package:movie_app/domain/use_case/similar_usecase.dart';

@injectable
class SimilarVeiwModel extends Cubit<HomesStates>{
  @factoryMethod
  SimilarVeiwModel(this.simicase):super(HomesInitialState());

  SimilarUsecase simicase;

  Getsimi(int index)async{
    emit(HomesLoadingState());
    var result = await simicase.call(index);
    result.fold((c){
      emit(HomesSuccessState(c));
    }, (error){
      emit(HomesErrorState(error));
    });
  }
}

abstract class HomesStates{}
class HomesInitialState extends HomesStates{}
class HomesLoadingState extends HomesStates{}
class HomesSuccessState extends HomesStates{
  List<Similarentity> cat;
  HomesSuccessState(this.cat);
}
class HomesErrorState extends HomesStates{
  String error;
  HomesErrorState(this.error);
}
