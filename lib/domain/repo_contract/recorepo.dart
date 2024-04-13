import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';

abstract class RecoRepo{
  Future<Either<List<Recomendentity>, String>> getRecomend();
}