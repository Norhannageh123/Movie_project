class ProfileInfoResponseEntity {
  ProfileInfoResponseEntity({
      this.message, 
      this.data,});

  String? message;
  DataInfoResponseEntity? data;
}
class DataInfoResponseEntity {
  DataInfoResponseEntity({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;


}