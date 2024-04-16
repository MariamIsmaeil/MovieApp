import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';

abstract class DiscoverRepo{
  Future<Either<List<Discoverentity>, String>> getdiscover(int id);
}