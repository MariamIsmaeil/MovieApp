import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/populardatamodel/Popular_model.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';

abstract class PopularRepo{
  Future<Either<List<Popularentity>, String>> getPopular();
}