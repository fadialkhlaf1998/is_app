class HomePageResponse {
  List<Banners>? banners;
  List<Categories>? categories;
  List<Styles>? styles;
  List<Moodboards>? moodboards;

  HomePageResponse(
      {this.banners, this.categories, this.styles, this.moodboards});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['styles'] != null) {
      styles = <Styles>[];
      json['styles'].forEach((v) {
        styles!.add(Styles.fromJson(v));
      });
    }
    if (json['moodboards'] != null) {
      moodboards = <Moodboards>[];
      json['moodboards'].forEach((v) {
        moodboards!.add(Moodboards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (styles != null) {
      data['styles'] = styles!.map((v) => v.toJson()).toList();
    }
    if (moodboards != null) {
      data['moodboards'] = moodboards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? bannerId;
  String? image;

  Banners({this.bannerId, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['image'] = image;
    return data;
  }
}

class Categories {
  int? categoryId;
  String? title;
  String? arTitle;
  String? image;

  Categories({this.categoryId, this.title, this.arTitle, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    title = json['title'];
    arTitle = json['ar_title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['title'] = title;
    data['ar_title'] = arTitle;
    data['image'] = image;
    return data;
  }
}

class Styles {
  int? styleId;
  String? title;
  String? arTitle;
  String? image;

  Styles({this.styleId, this.title, this.arTitle, this.image});

  Styles.fromJson(Map<String, dynamic> json) {
    styleId = json['style_id'];
    title = json['title'];
    arTitle = json['ar_title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style_id'] = styleId;
    data['title'] = title;
    data['ar_title'] = arTitle;
    data['image'] = image;
    return data;
  }
}

class Moodboards {
  int? moodboardId;
  String? title;
  String? arTitle;
  String? image;

  Moodboards({this.moodboardId, this.title, this.arTitle, this.image});

  Moodboards.fromJson(Map<String, dynamic> json) {
    moodboardId = json['moodboard_id'];
    title = json['title'];
    arTitle = json['ar_title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moodboard_id'] = moodboardId;
    data['title'] = title;
    data['ar_title'] = arTitle;
    data['image'] = image;
    return data;
  }
}
