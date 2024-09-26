class SignUpBody {
  String? fullName;
  String? phone;
  String? email;
  String? password;

  SignUpBody({this.fullName, this.phone, this.email, this.password});

  SignUpBody.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
