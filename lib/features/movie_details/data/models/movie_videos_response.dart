import 'package:json_annotation/json_annotation.dart';

part 'movie_videos_response.g.dart';

@JsonSerializable()
class MovieVideosResponse {
  final int id;
  final List<MovieVideoResponse> results;

  MovieVideosResponse({
    required this.id,
    required this.results,
  });

  factory MovieVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideosResponseToJson(this);
}

@JsonSerializable()
class MovieVideoResponse {
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  @JsonKey(name: "published_at")
  final DateTime publishedAt;
  final String id;

  MovieVideoResponse({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory MovieVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoResponseToJson(this);
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
