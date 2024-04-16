import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/data/datasource_contract/genredata.dart';
import 'package:movie_app/data/model/genredatamodel/Genredatamodel.dart';
@Injectable(as:  Genredata)
class Genredataimp extends Genredata {
  ApiManager apiManager;

  @factoryMethod
  Genredataimp(this.apiManager);


  @override
  Future<Either<Genredatamodel, String>> getGenre() async {
    try {
      var response = await apiManager.getRequest(
          endpoint: Endpoints.genre);
      Genredatamodel Genremodel = Genredatamodel.fromJson(response.data);
      return Left(Genremodel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}