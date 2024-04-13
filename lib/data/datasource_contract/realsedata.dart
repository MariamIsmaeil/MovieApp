import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/realsedatamodel/Realsemodel.dart';

abstract class Realsedata{
  Future<Either<Realsemodel, String>>getRealse();
}