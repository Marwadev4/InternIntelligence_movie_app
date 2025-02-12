import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'expires_at')
  final String expiresAt;
  @JsonKey(name: 'guest_session_id')
  final String guestSessionId;

  SignupResponse({
    required this.success,
    required this.expiresAt,
    required this.guestSessionId,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
