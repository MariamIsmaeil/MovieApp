import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/recommenddatamodel/Recommebddatamode.dart';

abstract class Recomenddata{
  Future<Either<Recommebddatamode, String>>getRecomend();
}