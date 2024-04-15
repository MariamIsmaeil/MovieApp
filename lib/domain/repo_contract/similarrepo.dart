import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';

abstract class Similarrepo{
  Future<Either<List<Similarentity>, String>> getSimilar(int index);
}

