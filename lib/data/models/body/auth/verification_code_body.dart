class VerificationCodeBody {
  String? email;
  String? code;

  VerificationCodeBody({this.email,this.code});

  VerificationCodeBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = code;
    return data;
  }
}
