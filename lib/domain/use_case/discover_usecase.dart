import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/repo_contract/discoverrepo.dart';
@injectable
class DiscoverUseCase{
  DiscoverRepo repo;
  DiscoverUseCase(this.repo);

  Future<Either<List<Discoverentity>, String>> call(int id)=>repo.getdiscover(id);
}