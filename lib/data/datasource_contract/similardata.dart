import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/similardatamosel/Similardatamodel.dart';

abstract class Similardata{
  Future<Either<Similardatamodel, String>>getSimilar(int index);
}