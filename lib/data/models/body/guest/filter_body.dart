class FilterBody {
  List<int>? categoryList;
  List<int>? styleList;
  List<int>? moodboardList;

  FilterBody({this.categoryList, this.styleList, this.moodboardList});

  FilterBody.fromJson(Map<String, dynamic> json) {
    categoryList = json['category_list'].cast<int>();
    styleList = json['style_list'].cast<int>();
    moodboardList = json['moodboard_list'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_list'] = categoryList;
    data['style_list'] = styleList;
    data['moodboard_list'] = moodboardList;
    return data;
  }
}
