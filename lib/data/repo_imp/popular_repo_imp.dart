import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/api/endpoints.dart';
import 'package:movie_app/data/datasource_contract/populardata.dart';
import 'package:movie_app/data/model/populardatamodel/Popular_model.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';
import 'package:movie_app/domain/repo_contract/popular_repo.dart';
@Injectable(as:  PopularRepo)
class popularRepoimp extends PopularRepo{
  populardata popular;
  @factoryMethod
  popularRepoimp(this.popular);
  @override
  Future<Either<List<Popularentity>, String>> getPopular() async {
    var result = await  popular.getPopular();
    return result.fold((response) {
      var popularListModel = response.results??[];
      var brand = popularListModel.map((results) => results.toPopularEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }

}