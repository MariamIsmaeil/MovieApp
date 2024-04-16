import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';

abstract class GenreRepo{
  Future<Either<List<Genreentity>, String>> getGenre();
}