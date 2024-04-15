import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/recommenddata.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';
import 'package:movie_app/domain/repo_contract/recorepo.dart';
@Injectable(as:  RecoRepo)
class recomRepoimp extends RecoRepo{
  Recomenddata reco;

  @factoryMethod
  recomRepoimp(this.reco);


  @override
  Future<Either<List<Recomendentity>, String>> getRecomend() async {
    var result = await  reco.getRecomend();
    return result.fold((response) {
      var RecoListModel = response.results??[];
      var brand = RecoListModel.map((results) => results.toRecomendEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }



}