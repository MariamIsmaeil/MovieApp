import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/genredatamodel/Genredatamodel.dart';

abstract class Genredata{
  Future<Either<Genredatamodel, String>>getGenre();
}