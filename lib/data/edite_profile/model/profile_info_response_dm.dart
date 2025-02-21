import 'package:movie_app/domain/edite_profile/entities/profile_info_response_entity.dart';

class ProfileInfoResponseDm extends ProfileInfoResponseEntity{
  ProfileInfoResponseDm({
      super.message,
      super.data,});

  ProfileInfoResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataInfoResponseDm.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = (data as DataInfoResponseDm?)?.toJson();
    }
    return map;
  }

}

class DataInfoResponseDm extends DataInfoResponseEntity{
  DataInfoResponseDm({
      super.id,
    super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    super.createdAt,
    super.updatedAt,
    super.v,});

  DataInfoResponseDm.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}