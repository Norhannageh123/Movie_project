
class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message,
      this.statusCode, 
      this.data,});
  String? message;
  DataEntity? data;
  String? statusCode;
  
}

class DataEntity {
  DataEntity({
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId,
      this.id,
      this.createdAt, 
      this.updatedAt, 
      this.v,});
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int?v;
  

}