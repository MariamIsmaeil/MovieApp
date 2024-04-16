import 'package:movie_app/domain/entity/search/Searchentity.dart';

/// adult : false
/// backdrop_path : "/9mrSx9MVmNOOlvcPxDTdf1APzud.jpg"
/// genre_ids : [16,28,14]
/// id : 1216221
/// original_language : "ja"
/// original_title : "「鬼滅の刃」絆の奇跡、そして柱稽古へ"
/// overview : "A compilation film featuring the eleventh episode of the Swordsmith Village Arc and the first episode of the Hashira Training Arc."
/// popularity : 871.792
/// poster_path : "/3daOEMQCOGU2n9EbUC0PICnUCek.jpg"
/// release_date : "2024-02-02"
/// title : "Demon Slayer: Kimetsu no Yaiba -To the Hashira Training-"
/// video : true
/// vote_average : 6.2
/// vote_count : 189

class Results {
  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
Results copyWith({  bool? adult,
  String? backdropPath,
  List<int>? genreIds,
  int? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  double? popularity,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  double? voteAverage,
  int? voteCount,
}) => Results(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  genreIds: genreIds ?? this.genreIds,
  id: id ?? this.id,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  releaseDate: releaseDate ?? this.releaseDate,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
  Searchentity toSearchEntity(){
    return Searchentity(
        id: id,title: title,posterPath:posterPath,voteAverage:voteAverage,voteCount:voteCount,overview:overview,
        video:video,releaseDate:releaseDate,popularity:popularity,originalTitle:originalTitle,originalLanguage:originalLanguage,
        genreIds:genreIds,backdropPath:backdropPath,adult:adult
    );
  }

}