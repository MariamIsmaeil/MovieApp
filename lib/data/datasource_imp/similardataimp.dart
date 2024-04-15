import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/data/datasource_contract/similardata.dart';
import 'package:movie_app/data/model/similardatamosel/Similardatamodel.dart';
@Injectable(as:  Similardata)
class Smilardataimp extends Similardata{
  ApiManager apiManager;
  @factoryMethod
  Smilardataimp(this.apiManager);
  @override
  Future<Either<Similardatamodel, String>> getSimilar(int movieId) async {
    var endpoint = '/movie/$movieId/similar';
    try{
      var response = await apiManager.getRequest(endpoint:endpoint,);
      Similardatamodel Similarmodel = Similardatamodel.fromJson(response.data);
      return Left(Similarmodel);
    }catch(error){
      return Right(error.toString());
    }
  }
}