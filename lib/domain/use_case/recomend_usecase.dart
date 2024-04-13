import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';
import 'package:movie_app/domain/repo_contract/recorepo.dart';
@injectable
class RecoUseCase{
  RecoRepo repo;
  RecoUseCase(this.repo);

  Future<Either<List<Recomendentity>, String>> call()=>repo.getRecomend();
}