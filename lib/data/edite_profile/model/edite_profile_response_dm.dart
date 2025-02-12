import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';

/// message : "Profile updated successfully"

class EditeProfileResponseDm extends EditeProfileResponseEntity {
  EditeProfileResponseDm({
    super.message, super.error, super.statusCode});

  EditeProfileResponseDm.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    return map;
  }

}