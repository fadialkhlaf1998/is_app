import 'package:is_app/data/models/response/guest/design_details_response.dart';

class CartResponse {
  double? subTotal;
  double? vat;
  double? discount;
  double? total;
  List<Cart>? cart;

  CartResponse({this.subTotal, this.vat, this.discount, this.total, this.cart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    subTotal = double.parse(json['sub_total'].toString());
    vat = double.parse(json['vat'].toString());
    discount = double.parse(json['discount'].toString());
    total = double.parse(json['total'].toString());
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_total'] = this.subTotal;
    data['vat'] = this.vat;
    data['discount'] = this.discount;
    data['total'] = this.total;
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int? cartId;
  double? width;
  double? height;
  double? length;
  Files? files;
  String? note;
  int? designId;
  int? accountId;
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
  String? style;
  String? arStyle;
  String? stringFiles;
  Moodboards? moodboard;

  Cart(
      {this.cartId,
      this.width,
      this.height,
      this.length,
      this.files,
      this.note,
      this.designId,
      this.accountId,
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
      this.style,
      this.arStyle,
      this.stringFiles,
      this.moodboard});

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    width = json['width'].toDouble();
    height = json['height'].toDouble();
    length = json['length'].toDouble();
    files = json['files'] != null ? new Files.fromJson(json['files']) : null;
    note = json['note'];
    designId = json['design_id'];
    accountId = json['account_id'];
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
    style = json['style'];
    arStyle = json['ar_style'];
    stringFiles = json['string_files'];
    moodboard = json['moodboard'] != null
        ? Moodboards.fromJson(json['moodboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    if (this.files != null) {
      data['files'] = this.files!.toJson();
    }
    data['note'] = this.note;
    data['design_id'] = this.designId;
    data['account_id'] = this.accountId;
    data['title'] = this.title;
    data['ar_title'] = this.arTitle;
    data['images'] = this.images;
    data['description'] = this.description;
    data['ar_description'] = this.arDescription;
    data['category_id'] = this.categoryId;
    data['style_id'] = this.styleId;
    data['price'] = this.price;
    data['category'] = this.category;
    data['ar_category'] = this.arCategory;
    data['style'] = this.style;
    data['ar_style'] = this.arStyle;
    data['string_files'] = this.stringFiles;
    if (this.moodboard != null) {
      data['moodboard'] = this.moodboard!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.cartId == cartId &&
        other.width == width &&
        other.height == height &&
        other.length == length &&
        other.files == files &&
        other.note == note &&
        other.designId == designId &&
        other.accountId == accountId &&
        other.title == title &&
        other.arTitle == arTitle &&
        other.images == images &&
        other.description == description &&
        other.arDescription == arDescription &&
        other.categoryId == categoryId &&
        other.styleId == styleId &&
        other.price == price &&
        other.category == category &&
        other.arCategory == arCategory &&
        other.style == style &&
        other.arStyle == arStyle &&
        other.stringFiles == stringFiles &&
        other.moodboard == moodboard;
  }

  @override
  int get hashCode {
    return cartId.hashCode ^
        width.hashCode ^
        height.hashCode ^
        length.hashCode ^
        files.hashCode ^
        note.hashCode ^
        designId.hashCode ^
        accountId.hashCode ^
        title.hashCode ^
        arTitle.hashCode ^
        images.hashCode ^
        description.hashCode ^
        arDescription.hashCode ^
        categoryId.hashCode ^
        styleId.hashCode ^
        price.hashCode ^
        category.hashCode ^
        arCategory.hashCode ^
        style.hashCode ^
        arStyle.hashCode ^
        stringFiles.hashCode ^
        moodboard.hashCode;
  }

  Cart clone() {
    return Cart(
      cartId: this.cartId,
      width: this.width,
      height: this.height,
      length: this.length,
      files: this.files?.clone(),
      note: this.note,
      designId: this.designId,
      accountId: this.accountId,
      title: this.title,
      arTitle: this.arTitle,
      images: this.images,
      description: this.description,
      arDescription: this.arDescription,
      categoryId: this.categoryId,
      styleId: this.styleId,
      price: this.price,
      category: this.category,
      arCategory: this.arCategory,
      style: this.style,
      arStyle: this.arStyle,
      stringFiles: this.stringFiles,
      moodboard: this.moodboard?.clone(),
    );
  }
}

class Files {
  String? corner1;
  String? corner2;
  String? corner3;
  String? corner4;
  String? pdf;
  String? dwg;

  Files(
      {this.corner1,
      this.corner2,
      this.corner3,
      this.corner4,
      this.pdf,
      this.dwg});

  Files.fromJson(Map<String, dynamic> json) {
    corner1 = json['corner_1'];
    corner2 = json['corner_2'];
    corner3 = json['corner_3'];
    corner4 = json['corner_4'];
    pdf = json['pdf'];
    dwg = json['dwg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['corner_1'] = this.corner1;
    data['corner_2'] = this.corner2;
    data['corner_3'] = this.corner3;
    data['corner_4'] = this.corner4;
    data['pdf'] = this.pdf;
    data['dwg'] = this.dwg;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Files &&
        other.corner1 == corner1 &&
        other.corner2 == corner2 &&
        other.corner3 == corner3 &&
        other.corner4 == corner4 &&
        other.pdf == pdf &&
        other.dwg == dwg;
  }

  @override
  int get hashCode {
    return corner1.hashCode ^
        corner2.hashCode ^
        corner3.hashCode ^
        corner4.hashCode ^
        pdf.hashCode ^
        dwg.hashCode;
  }

  Files clone() {
    return Files(
      corner1: this.corner1,
      corner2: this.corner2,
      corner3: this.corner3,
      corner4: this.corner4,
      pdf: this.pdf,
      dwg: this.dwg,
    );
  }
}

// class CartMoodboard {
//   int? moodboardDesignId;
//   int? moodboardId;
//   int? designId;
//   String? images;
//   String? moodboard;
//   String? arMoodboard;
//   String? moodboardImage;
//
//   CartMoodboard(
//       {this.moodboardDesignId,
//       this.moodboardId,
//       this.designId,
//       this.images,
//       this.moodboard,
//       this.arMoodboard,
//       this.moodboardImage});
//
//   CartMoodboard.fromJson(Map<String, dynamic> json) {
//     moodboardDesignId = json['moodboard_design_id'];
//     moodboardId = json['moodboard_id'];
//     designId = json['design_id'];
//     images = json['images'];
//     moodboard = json['moodboard'];
//     arMoodboard = json['ar_moodboard'];
//     moodboardImage = json['moodboard_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['moodboard_design_id'] = this.moodboardDesignId;
//     data['moodboard_id'] = this.moodboardId;
//     data['design_id'] = this.designId;
//     data['images'] = this.images;
//     data['moodboard'] = this.moodboard;
//     data['ar_moodboard'] = this.arMoodboard;
//     data['moodboard_image'] = this.moodboardImage;
//     return data;
//   }
//
//
// }
