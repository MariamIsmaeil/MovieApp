import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';

abstract class RealseRepo{
  Future<Either<List<Realserntity>, String>> getRealse();
}