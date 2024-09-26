class DesignResponse {
  int? designId;
  String? title;
  String? arTitle;
  String? images;
  String? description;
  String? arDescription;
  int? categoryId;
  int? styleId;
  int? price;
  String? category;
  String? arCategory;
  String? categoryImage;
  String? style;
  String? arStyle;
  String? styleImage;
  List<Moodboards>? moodboards;

  DesignResponse(
      {this.designId,
      this.title,
      this.arTitle,
      this.images,
      this.description,
      this.arDescription,
      this.categoryId,
      this.styleId,
      this.price,
      this.category,
      this.arCategory,
      this.categoryImage,
      this.style,
      this.arStyle,
      this.styleImage,
      this.moodboards});

  DesignResponse.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    title = json['title'];
    arTitle = json['ar_title'];
    images = json['images'];
    description = json['description'];
    arDescription = json['ar_description'];
    categoryId = json['category_id'];
    styleId = json['style_id'];
    price = json['price'];
    category = json['category'];
    arCategory = json['ar_category'];
    categoryImage = json['category_image'];
    style = json['style'];
    arStyle = json['ar_style'];
    styleImage = json['style_image'];
    if (json['moodboards'] != null) {
      moodboards = <Moodboards>[];
      json['moodboards'].forEach((v) {
        moodboards!.add(Moodboards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['design_id'] = designId;
    data['title'] = title;
    data['ar_title'] = arTitle;
    data['images'] = images;
    data['description'] = description;
    data['ar_description'] = arDescription;
    data['category_id'] = categoryId;
    data['style_id'] = styleId;
    data['price'] = price;
    data['category'] = category;
    data['ar_category'] = arCategory;
    data['category_image'] = categoryImage;
    data['style'] = style;
    data['ar_style'] = arStyle;
    data['style_image'] = styleImage;
    if (moodboards != null) {
      data['moodboards'] = moodboards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moodboards {
  int? moodboardDesignId;
  int? moodboardId;
  int? designId;
  String? moodboard;
  String? arMoodboard;
  String? moodboardImage;

  Moodboards(
      {this.moodboardDesignId,
      this.moodboardId,
      this.designId,
      this.moodboard,
      this.arMoodboard,
      this.moodboardImage});

  Moodboards.fromJson(Map<String, dynamic> json) {
    moodboardDesignId = json['moodboard_design_id'];
    moodboardId = json['moodboard_id'];
    designId = json['design_id'];
    moodboard = json['moodboard'];
    arMoodboard = json['ar_moodboard'];
    moodboardImage = json['moodboard_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moodboard_design_id'] = moodboardDesignId;
    data['moodboard_id'] = moodboardId;
    data['design_id'] = designId;
    data['moodboard'] = moodboard;
    data['ar_moodboard'] = arMoodboard;
    data['moodboard_image'] = moodboardImage;
    return data;
  }
}
