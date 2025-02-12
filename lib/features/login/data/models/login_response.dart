import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'expires_at')
  final String expiresAt;
  @JsonKey(name: 'guest_session_id')
  final String guestSessionId;

  LoginResponse({
    required this.success,
    required this.expiresAt,
    required this.guestSessionId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
