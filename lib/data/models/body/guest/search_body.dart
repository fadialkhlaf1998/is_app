class SearchBody {
  String? query;

  SearchBody({this.query});

  SearchBody.fromJson(Map<String, dynamic> json) {
    query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    return data;
  }
}
