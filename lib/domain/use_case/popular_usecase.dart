import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/populardatamodel/Popular_model.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';
import 'package:movie_app/domain/repo_contract/popular_repo.dart';
@injectable
class PopularUseCase{
  PopularRepo repo;
  PopularUseCase(this.repo);

  Future<Either<List<Popularentity>, String>> call()=>repo.getPopular();
}