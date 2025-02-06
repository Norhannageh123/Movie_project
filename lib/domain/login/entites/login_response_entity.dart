/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTE4MjRhZWE4MjhhMzdkNWE3YjAzYiIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3Mzg4MDYyMjd9.C1yzbLQ-912oTAtK5-zJ8S---E5xduYbxrxdP-FVd5M"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message,
      this.statusCode ,
      this.data,});

  String? message;
  String? data;
  String? statusCode;
}