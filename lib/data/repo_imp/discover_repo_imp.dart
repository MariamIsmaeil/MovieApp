import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/discoverdata.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/repo_contract/discoverrepo.dart';
@Injectable(as:  DiscoverRepo)
class DiscoverRepoimp extends DiscoverRepo{
  Discoverdata dis;

  @factoryMethod
  DiscoverRepoimp(this.dis);

  @override
  Future<Either<List<Discoverentity>, String>> getdiscover(int id) async {
    var result = await  dis.getDiscover(id);
    return result.fold((response) {
      var DiscoverListModel = response.results??[];
      var brand = DiscoverListModel.map((results) => results.toDiscoverEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }



}