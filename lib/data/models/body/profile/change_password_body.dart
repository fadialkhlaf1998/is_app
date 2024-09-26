class ChangePasswordBody {
  String? old;
  String? newPass;
  String? confirm;

  ChangePasswordBody({this.old, this.newPass, this.confirm});

  ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    old = json['old'];
    newPass = json['new'];
    confirm = json['confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old'] = old;
    data['new'] = newPass;
    data['confirm'] = confirm;
    return data;
  }
}
