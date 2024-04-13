import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/data/datasource_contract/realsedata.dart';
import 'package:movie_app/data/model/realsedatamodel/Realsemodel.dart';
@Injectable(as:  Realsedata)
class realsedataimp extends Realsedata{
  ApiManager apiManager;
  @factoryMethod
  realsedataimp(this.apiManager);
  @override
  Future<Either<Realsemodel, String>> getRealse() async {
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.RelaseEndpoint);
      Realsemodel RealseModel = Realsemodel.fromJson(response.data);
      return Left(RealseModel);
    }catch(error){
      return Right(error.toString());
    }
  }



}