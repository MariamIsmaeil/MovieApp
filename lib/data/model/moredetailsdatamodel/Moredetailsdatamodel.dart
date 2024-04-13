import 'Genres.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

/// adult : false
/// backdrop_path : "/e3gVl1gnxEFKLTF6pn6KRqUPi9K.jpg"
/// belongs_to_collection : null
/// budget : 7000000
/// genres : [{"id":10749,"name":"Romance"},{"id":18,"name":"Drama"}]
/// homepage : "https://www.netflix.com/title/81711218"
/// id : 1127166
/// imdb_id : "tt29114029"
/// original_language : "it"
/// original_title : "Fabbricante di lacrime"
/// overview : "Adopted together after a tough childhood in an orphanage, Nica and Rigel realize that unexpected but irresistible feelings pull them together."
/// popularity : 872.382
/// poster_path : "/uoBHsxSgfc3PQsSn98RfnbePHOy.jpg"
/// production_companies : [{"id":2534,"logo_path":"/6aizJC0RRO5oprJMYf2PBAB7lyZ.png","name":"Colorado Film","origin_country":"IT"}]
/// production_countries : [{"iso_3166_1":"IT","name":"Italy"}]
/// release_date : "2024-04-03"
/// revenue : 0
/// runtime : 106
/// spoken_languages : [{"english_name":"Italian","iso_639_1":"it","name":"Italiano"}]
/// status : "Released"
/// tagline : ""
/// title : "The Tearsmith"
/// video : false
/// vote_average : 6.814
/// vote_count : 279

class Moredetailsdatamodel {
  Moredetailsdatamodel({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Moredetailsdatamodel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
Moredetailsdatamodel copyWith({  bool? adult,
  String? backdropPath,
  dynamic belongsToCollection,
  int? budget,
  List<Genres>? genres,
  String? homepage,
  int? id,
  String? imdbId,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  double? popularity,
  String? posterPath,
  List<ProductionCompanies>? productionCompanies,
  List<ProductionCountries>? productionCountries,
  String? releaseDate,
  int? revenue,
  int? runtime,
  List<SpokenLanguages>? spokenLanguages,
  String? status,
  String? tagline,
  String? title,
  bool? video,
  double? voteAverage,
  int? voteCount,
}) => Moredetailsdatamodel(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  belongsToCollection: belongsToCollection ?? this.belongsToCollection,
  budget: budget ?? this.budget,
  genres: genres ?? this.genres,
  homepage: homepage ?? this.homepage,
  id: id ?? this.id,
  imdbId: imdbId ?? this.imdbId,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  productionCompanies: productionCompanies ?? this.productionCompanies,
  productionCountries: productionCountries ?? this.productionCountries,
  releaseDate: releaseDate ?? this.releaseDate,
  revenue: revenue ?? this.revenue,
  runtime: runtime ?? this.runtime,
  spokenLanguages: spokenLanguages ?? this.spokenLanguages,
  status: status ?? this.status,
  tagline: tagline ?? this.tagline,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}