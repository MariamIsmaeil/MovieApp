import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/search/Searchdatamodel.dart';

abstract class Searchdata{
  Future<Either<Searchdatamodel, String>>getSearch(String text );
}