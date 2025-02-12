import 'package:json_annotation/json_annotation.dart';

part 'rating_response.g.dart';

@JsonSerializable()
class RatingResponse {
  final bool success;
  @JsonKey(name: "status_code")
  final int statusCode;
  @JsonKey(name: "status_message")
  final String statusMessage;

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  RatingResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
