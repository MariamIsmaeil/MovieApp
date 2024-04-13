import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';

abstract class PopularRepo{
  Future<Either<List<Popularentity>, String>> getPopular();
}