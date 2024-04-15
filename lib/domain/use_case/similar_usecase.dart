import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';
import 'package:movie_app/domain/repo_contract/similarrepo.dart';
@injectable
class SimilarUsecase{
  Similarrepo simi;
  SimilarUsecase(this.simi);

  Future<Either<List<Similarentity>, String>> call(int index)=>simi.getSimilar(index);
}