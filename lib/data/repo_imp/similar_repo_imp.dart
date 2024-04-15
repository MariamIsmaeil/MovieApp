import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/realsedata.dart';
import 'package:movie_app/data/datasource_contract/recommenddata.dart';
import 'package:movie_app/data/datasource_contract/similardata.dart';
import 'package:movie_app/data/model/similardatamosel/Similardatamodel.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';
import 'package:movie_app/domain/repo_contract/realserepo.dart';
import 'package:movie_app/domain/repo_contract/recorepo.dart';
import 'package:movie_app/domain/repo_contract/similarrepo.dart';
@Injectable(as:  Similarrepo)
class SimilarRepoImp extends Similarrepo{
  Similardata simi;

  @factoryMethod
  SimilarRepoImp(this.simi);

  @override
  Future<Either<List<Similarentity>, String>> getSimilar(int index) async {
    var result = await  simi.getSimilar(index);
    return result.fold((response) {
      var SimilarListModel = response.results??[];
      var brand = SimilarListModel.map((results) => results.toSimilarEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }



}