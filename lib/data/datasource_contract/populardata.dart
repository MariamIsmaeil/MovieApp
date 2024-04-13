import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/populardatamodel/Popular_model.dart';

abstract class populardata{
  Future<Either<PopularModel, String>>getPopular();
}