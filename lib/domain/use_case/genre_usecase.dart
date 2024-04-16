import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';
import 'package:movie_app/domain/repo_contract/genrerepo.dart';
@injectable
class GenreUseCase{
  GenreRepo repo;
  GenreUseCase(this.repo);

  Future<Either<List<Genreentity>, String>> call()=>repo.getGenre();
}