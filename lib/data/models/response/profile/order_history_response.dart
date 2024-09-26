class OrderHistoryResponse {
  int? orderId;
  double? total;
  double? subTotal;
  double? vat;
  double? discount;
  String? status;
  int? accountId;
  String? createdAt;
  int? designCount;

  OrderHistoryResponse(
      {this.orderId,
      this.total,
      this.subTotal,
      this.vat,
      this.discount,
      this.status,
      this.accountId,
      this.createdAt,
      this.designCount});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    total = double.parse(json['total'].toString());
    subTotal = double.parse(json['sub_total'].toString());
    vat = double.parse(json['vat'].toString());
    discount = double.parse(json['discount'].toString());
    status = json['status'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    designCount = json['design_count'];
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
    data['design_count'] = designCount;
    return data;
  }
}
