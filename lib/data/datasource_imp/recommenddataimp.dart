import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/data/datasource_contract/recommenddata.dart';
import 'package:movie_app/data/model/recommenddatamodel/Recommebddatamode.dart';
@Injectable(as:  Recomenddata)
class recomenddataimp extends Recomenddata{
  ApiManager apiManager;
  @factoryMethod
  recomenddataimp(this.apiManager);

  @override
  Future<Either<Recommebddatamode, String>> getRecomend() async {
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.RecommendEndpoint);
      Recommebddatamode RecomendModel = Recommebddatamode.fromJson(response.data);
      return Left(RecomendModel);
    }catch(error){
      return Right(error.toString());
    }
  }




}