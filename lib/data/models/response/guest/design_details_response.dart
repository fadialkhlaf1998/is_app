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
  String? allImages;

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
      this.moodboards,
      this.allImages});

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
    allImages = json['allImages'];
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
    data['allImages'] = allImages;
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
  String? images;
  String? moodboard;
  String? arMoodboard;
  String? moodboardImage;

  Moodboards(
      {this.moodboardDesignId,
      this.moodboardId,
      this.designId,
      this.images,
      this.moodboard,
      this.arMoodboard,
      this.moodboardImage});

  Moodboards.fromJson(Map<String, dynamic> json) {
    moodboardDesignId = json['moodboard_design_id'];
    moodboardId = json['moodboard_id'];
    designId = json['design_id'];
    images = json['images'];
    moodboard = json['moodboard'];
    arMoodboard = json['ar_moodboard'];
    moodboardImage = json['moodboard_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moodboard_design_id'] = moodboardDesignId;
    data['moodboard_id'] = moodboardId;
    data['design_id'] = designId;
    data['images'] = images;
    data['moodboard'] = moodboard;
    data['ar_moodboard'] = arMoodboard;
    data['moodboard_image'] = moodboardImage;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Moodboards &&
        other.moodboardDesignId == moodboardDesignId &&
        other.moodboardId == moodboardId &&
        other.designId == designId &&
        other.images == images &&
        other.moodboard == moodboard &&
        other.arMoodboard == arMoodboard &&
        other.moodboardImage == moodboardImage;
  }

  @override
  int get hashCode {
    return moodboardDesignId.hashCode ^
        moodboardId.hashCode ^
        designId.hashCode ^
        images.hashCode ^
        moodboard.hashCode ^
        arMoodboard.hashCode ^
        moodboardImage.hashCode;
  }

  Moodboards clone() {
    return Moodboards(
      moodboardDesignId: this.moodboardDesignId,
      moodboardId: this.moodboardId,
      designId: this.designId,
      images: this.images,
      moodboard: this.moodboard,
      arMoodboard: this.arMoodboard,
      moodboardImage: this.moodboardImage,
    );
  }
}
