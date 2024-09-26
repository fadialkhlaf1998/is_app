class UserData {
  int? accountId;
  String? fullName;
  String? phone;
  String? role;
  String? email;
  String? password;
  String? image;
  String? token;

  UserData(
      {this.accountId,
      this.fullName,
      this.phone,
      this.role,
      this.email,
      this.password,
      this.image,
      this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    fullName = json['full_name'];
    phone = json['phone'];
    role = json['role'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['role'] = role;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['token'] = token;
    return data;
  }
}
