import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/use_case/discover_usecase.dart';

@injectable
class DiscoverViewModel extends Cubit<HoomeTabStates>{
  @factoryMethod
  DiscoverViewModel(this.DiscoveruseCase):super(HoomeTabInitialState());

  DiscoverUseCase DiscoveruseCase;

  GetDiscover(int id)async{
    print("kfk");
    emit(HoomeTabLoadingState());
    var result = await DiscoveruseCase.call(id);
    result.fold((categories){
      emit(HoomeTabSuccessState(categories));
    }, (error){
      emit(HoomeTabErrorState(error));
    });
  }
}

abstract class HoomeTabStates{}
class HoomeTabInitialState extends HoomeTabStates{}
class HoomeTabLoadingState extends HoomeTabStates{}
class HoomeTabSuccessState extends HoomeTabStates{
  List<Discoverentity> categories;
  HoomeTabSuccessState(this.categories);
}
class HoomeTabErrorState extends HoomeTabStates{
  String error;
  HoomeTabErrorState(this.error);
}
