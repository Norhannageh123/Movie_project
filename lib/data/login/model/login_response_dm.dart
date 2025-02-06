import 'package:movie_app/domain/login/entites/login_response_entity.dart';

/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTE4MjRhZWE4MjhhMzdkNWE3YjAzYiIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3Mzg4MDg0NjF9.PWhrZ-LU7fC3STvwkZOecKmLb-nrwI2R8VMnzH0Eoi0"

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message, 
      super.statusCode,
      super.data,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
    statusCode=json['statusCode'];
  }

  String? message;
  String? data;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    map['statusCode']=statusCode;
    return map;
  }

}