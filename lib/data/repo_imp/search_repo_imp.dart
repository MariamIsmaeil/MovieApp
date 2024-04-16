import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/discoverdata.dart';
import 'package:movie_app/data/datasource_contract/searchdata.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';
import 'package:movie_app/domain/repo_contract/discoverrepo.dart';
import 'package:movie_app/domain/repo_contract/searchrepo.dart';
@Injectable(as:  SearchRepo)
class SearchRepoimp extends SearchRepo{
  Searchdata sa;

  @factoryMethod
  SearchRepoimp(this.sa);



  @override
  Future<Either<List<Searchentity>, String>> getSearch(String textsearch) async {
    var result = await  sa.getSearch(textsearch);
    return result.fold((response) {
      var SaerchListModel = response.results??[];
      var brand = SaerchListModel.map((results) => results.toSearchEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }



}