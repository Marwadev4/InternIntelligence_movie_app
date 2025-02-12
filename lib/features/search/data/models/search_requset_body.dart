import 'package:json_annotation/json_annotation.dart';

part 'search_requset_body.g.dart';

@JsonSerializable()
class SearchRequestBody {
  final String query;
  @JsonKey(name: 'include_adult')
  final bool adult;
  @JsonKey(name: 'primary_release_year')
  final String? primaryReleaseYear;
  final String? region;
  final String? year;
  final int page;

  SearchRequestBody({
    required this.query,
    this.adult = false,
    this.primaryReleaseYear,
    this.region,
    this.year,
    this.page = 1,
  });

  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);
}
