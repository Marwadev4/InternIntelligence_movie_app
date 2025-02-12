import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/core/models/category_response.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final BelongsToCollection? belongsToCollection;
  final int id;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  final String overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "release_date")
  final DateTime releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;
  final int budget;
  @JsonKey(name: "genres")
  final List<CategoryResponse> categories;
  final String homepage;
  @JsonKey(name: "imdb_id")
  final String imdbId;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "production_companies")
  final List<ProductionCompany> productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountry> productionCountries;
  final int revenue;
  final int runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  MovieDetailsResponse({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.belongsToCollection,
    required this.budget,
    required this.categories,
    required this.homepage,
    required this.imdbId,
    required this.originCountry,
    required this.productionCompanies,
    required this.productionCountries,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
  });

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  final int id;
  @JsonKey(name: "logo_path")
  final String logoPath;
  final String name;
  @JsonKey(name: "origin_country")
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "english_name")
  final String englishName;
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  final int id;
  final String name;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
