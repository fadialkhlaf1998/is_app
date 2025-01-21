import 'package:is_app/data/models/response/guest/design_details_response.dart';

class OrderDetailsResponse {
  int? orderId;
  double? total;
  double? subTotal;
  double? vat;
  double? discount;
  String? status;
  int? accountId;
  String? createdAt;
  List<OrderItems>? orderItems;

  OrderDetailsResponse(
      {this.orderId,
      this.total,
      this.subTotal,
      this.vat,
      this.discount,
      this.status,
      this.accountId,
      this.createdAt,
      this.orderItems});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    total = double.parse(json['total'].toString());
    subTotal = double.parse(json['sub_total'].toString());
    vat = double.parse(json['vat'].toString());
    discount = double.parse(json['discount'].toString());
    status = json['status'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['total'] = total;
    data['sub_total'] = subTotal;
    data['vat'] = vat;
    data['discount'] = discount;
    data['status'] = status;
    data['account_id'] = accountId;
    data['created_at'] = createdAt;
    if (orderItems != null) {
      data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? orderItemId;
  int? width;
  int? height;
  int? length;
  Files? files;
  String? note;
  int? designId;
  int? orderId;
  String? title;
  String? arTitle;
  String? images;
  String? description;
  String? arDescription;
  int? categoryId;
  int? styleId;
  int? price;
  String? stringFiles;
  Moodboards? moodboard;


  OrderItems(
      {this.orderItemId,
      this.width,
      this.height,
      this.length,
      this.files,
      this.note,
      this.designId,
      this.orderId,
      this.title,
      this.arTitle,
      this.images,
      this.description,
      this.arDescription,
      this.categoryId,
      this.styleId,
      this.price,
      this.stringFiles,
      this.moodboard
      });

  OrderItems.fromJson(Map<String, dynamic> json) {
    orderItemId = json['order_item_id'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    files = json['files'] != null ? Files.fromJson(json['files']) : null;
    note = json['note'];
    designId = json['design_id'];
    orderId = json['order_id'];
    title = json['title'];
    arTitle = json['ar_title'];
    images = json['images'];
    description = json['description'];
    arDescription = json['ar_description'];
    categoryId = json['category_id'];
    styleId = json['style_id'];
    price = json['price'];
    stringFiles = json['string_files'];
    moodboard = json['moodboard'] != null
        ? Moodboards.fromJson(json['moodboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_item_id'] = orderItemId;
    data['width'] = width;
    data['height'] = height;
    data['length'] = length;
    if (files != null) {
      data['files'] = files!.toJson();
    }
    data['note'] = note;
    data['design_id'] = designId;
    data['order_id'] = orderId;
    data['title'] = title;
    data['ar_title'] = arTitle;
    data['images'] = images;
    data['description'] = description;
    data['ar_description'] = arDescription;
    data['category_id'] = categoryId;
    data['style_id'] = styleId;
    data['price'] = price;
    data['string_files'] = stringFiles;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['corner_1'] = corner1;
    data['corner_2'] = corner2;
    data['corner_3'] = corner3;
    data['corner_4'] = corner4;
    data['pdf'] = pdf;
    data['dwg'] = dwg;
    return data;
  }
}
