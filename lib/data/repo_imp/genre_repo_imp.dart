import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasource_contract/genredata.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';
import 'package:movie_app/domain/repo_contract/genrerepo.dart';
@Injectable(as:  GenreRepo)
class GenreRepoimp extends GenreRepo{
  Genredata gen;

  @factoryMethod
  GenreRepoimp(this.gen);
 
  @override
  Future<Either<List<Genreentity>, String>> getGenre() async {
    var result = await  gen.getGenre();
    return result.fold((response) {
      var genreListModel = response.genres??[];
      var brand = genreListModel.map((results) => results.toGenreEntity()).toList();
      return Left(brand);
    }, (error){
      return Right(error);
    }
    );
  }

}