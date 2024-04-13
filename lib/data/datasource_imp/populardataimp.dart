import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/data/datasource_contract/populardata.dart';
import 'package:movie_app/data/model/populardatamodel/Popular_model.dart';
@Injectable(as:  populardata)
class datapopularimp extends populardata{
  ApiManager apiManager;
  @factoryMethod
  datapopularimp(this.apiManager);
  @override
  Future<Either<PopularModel, String>> getPopular() async {
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.PopularEndpoint);
      PopularModel Popularmodel = PopularModel.fromJson(response.data);
      return Left(Popularmodel);
    }catch(error){
      return Right(error.toString());
    }
  }

}