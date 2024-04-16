import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';

abstract class SearchRepo{
  Future<Either<List<Searchentity>, String>> getSearch(String textsearch);
}