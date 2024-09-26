class SearchResponse {
  String? title;
  String? arTitle;
  String? images;
  int? designId;

  SearchResponse({this.title, this.arTitle, this.images, this.designId});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arTitle = json['ar_title'];
    images = json['images'];
    designId = json['design_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['ar_title'] = this.arTitle;
    data['images'] = this.images;
    data['design_id'] = this.designId;
    return data;
  }
}
