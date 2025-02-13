import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/reset_password/entites/reset_response_entity.dart';

/// message : "Password updated successfully"
@JsonSerializable()
class ResetResponseDm extends ResetResponseEntity {
  ResetResponseDm({
      super.message,
      super.statusCode,
  });

  ResetResponseDm.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}