import 'package:note/api/models/user.dart';

class AuthResponse {
  bool? status;
  String? message;
  int? code;
  User? user;

  AuthResponse({this.status, this.message, this.code, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    user = json['object'] != null ? new User.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.user != null) {
      data['object'] = this.user!.toJson();
    }

    return data;
  }
}
