class User {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? fcmToken;
  String? token;
  String? refreshToken;
  bool? isActive;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.gender,
      this.fcmToken,
      this.token,
      this.refreshToken,
      this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['fcm_token'] = this.fcmToken;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['is_active'] = this.isActive;
    return data;
  }
}
