import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';
import 'package:movie_app/domain/repo_contract/searchrepo.dart';
@injectable
class SearchUseCase{
  SearchRepo se;
  SearchUseCase(this.se);

  Future<Either<List<Searchentity>, String>> call(String teaxtsearch)=>se.getSearch(teaxtsearch);
}