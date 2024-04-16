import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/data/datasource_contract/searchdata.dart';
import 'package:movie_app/data/model/search/Searchdatamodel.dart';
@Injectable(as:  Searchdata)
class Searchdataimp extends Searchdata {
  ApiManager apiManager;

  @factoryMethod
  Searchdataimp(this.apiManager);




  @override
  Future<Either<Searchdatamodel, String>> getSearch(String text) async {
    try {
      var response = await apiManager.getRequest(
          endpoint: Endpoints.Search,queryParameters: {Constants.prams:text});
      Searchdatamodel Searchmodel = Searchdatamodel.fromJson(response.data);
      return Left(Searchmodel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}