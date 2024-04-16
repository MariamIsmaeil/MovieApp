import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/data/datasource_contract/discoverdata.dart';
import 'package:movie_app/data/datasource_contract/genredata.dart';
import 'package:movie_app/data/model/discoverdatamodel/Discoverdatamodel.dart';
import 'package:movie_app/data/model/genredatamodel/Genredatamodel.dart';
@Injectable(as:  Discoverdata)
class Discoverdataimp extends Discoverdata {
  ApiManager apiManager;

  @factoryMethod
  Discoverdataimp(this.apiManager);


  @override
  Future<Either<Discoverdatamodel, String>> getDiscover(int id) async {
    try {
      var response = await apiManager.getRequest(
          endpoint: Endpoints.discover,queryParameters: {Constants.discover:id});
      Discoverdatamodel Discovermodel = Discoverdatamodel.fromJson(response.data);
      return Left(Discovermodel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}