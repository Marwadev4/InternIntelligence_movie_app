import 'package:json_annotation/json_annotation.dart';

part 'rating_request_body.g.dart';

@JsonSerializable()
class RatingRequestBody {
  final double value;

  factory RatingRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RatingRequestBodyFromJson(json);

  RatingRequestBody({required this.value});


  Map<String, dynamic> toJson() => _$RatingRequestBodyToJson(this);
}
