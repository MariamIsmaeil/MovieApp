import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/repo_contract/realserepo.dart';
@injectable
class RealsUseCase{
  RealseRepo repo;
  RealsUseCase(this.repo);

  Future<Either<List<Realserntity>, String>> call()=>repo.getRealse();
}