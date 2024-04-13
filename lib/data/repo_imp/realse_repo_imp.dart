import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/realsedata.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/repo_contract/realserepo.dart';
@Injectable(as:  RealseRepo)
class realseRepoimp extends RealseRepo{
  Realsedata realse;

  @factoryMethod
  realseRepoimp(this.realse);

  @override
  Future<Either<List<Realserntity>, String>> getRealse() async {
    var result = await  realse.getRealse();
    return result.fold((response) {
      var RealseListModel = response.results??[];
      var brand = RealseListModel.map((results) => results.torealseEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }



}