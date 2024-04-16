import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/discoverdatamodel/Discoverdatamodel.dart';

abstract class Discoverdata{
  Future<Either<Discoverdatamodel, String>>getDiscover(int id );
}