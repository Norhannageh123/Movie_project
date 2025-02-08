

import 'package:movie_app/domain/register/entites/register_response_entity.dart';

/// message : "User created successfully"
/// data : {"email":"norhan1@gmail.com","password":"$2b$10$9VSSr2e4XHjp3c6NSv2yZeB4TpGQKu6Y9QV2oJSD6BinCRb1mx.r6","name":"norhan","phone":"+201141209334","avaterId":1,"_id":"67a4f79186c9a6f15cbfced4","createdAt":"2025-02-06T17:55:29.215Z","updatedAt":"2025-02-06T17:55:29.215Z","__v":0}

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message, 
      super.statusCode,
      super.data,});

  RegisterResponseDm.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = json['data'] != null ? DataDM.fromJson(json['data'] as Map<String, dynamic>) : null;
  }



}

/// email : "norhan1@gmail.com"
/// password : "$2b$10$9VSSr2e4XHjp3c6NSv2yZeB4TpGQKu6Y9QV2oJSD6BinCRb1mx.r6"
/// name : "norhan"
/// phone : "+201141209334"
/// avaterId : 1
/// _id : "67a4f79186c9a6f15cbfced4"
/// createdAt : "2025-02-06T17:55:29.215Z"
/// updatedAt : "2025-02-06T17:55:29.215Z"
/// __v : 0

class DataDM extends DataEntity {
  DataDM({
      super.email, 
      super.password, 
      super.name, 
      super.phone, 
      super.avaterId,
      super.id,
      super.createdAt, 
      super.updatedAt, 
      super.v,});

  DataDM.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }




}