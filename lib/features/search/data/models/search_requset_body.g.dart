// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_requset_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestBody _$SearchRequestBodyFromJson(Map<String, dynamic> json) =>
    SearchRequestBody(
      query: json['query'] as String,
      adult: json['include_adult'] as bool? ?? false,
      primaryReleaseYear: json['primary_release_year'] as String?,
      region: json['region'] as String?,
      year: json['year'] as String?,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$SearchRequestBodyToJson(SearchRequestBody instance) =>
    <String, dynamic>{
      'query': instance.query,
      'include_adult': instance.adult,
      'primary_release_year': instance.primaryReleaseYear,
      'region': instance.region,
      'year': instance.year,
      'page': instance.page,
    };
