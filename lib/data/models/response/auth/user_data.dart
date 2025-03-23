class UserData {
  int? accountId;
  String? fullName;
  String? phone;
  String? role;
  String? email;
  String? password;
  String? image;
  int? is_active;
  String? token;
  String? created_at ;

  UserData(
      {this.accountId,
      this.fullName,
      this.phone,
      this.role,
      this.email,
      this.password,
      this.image,
      this.is_active,
      this.created_at,
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
    is_active = json['is_active'];
    created_at = json['created_at'];
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
    data['is_active'] = is_active;
    data['created_at'] = created_at;
    return data;
  }
}
