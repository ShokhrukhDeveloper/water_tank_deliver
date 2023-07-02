import 'package:water_tank_deliver/Data/Model/Order.dart';

import 'Order.dart';

class OrdersPagenated {
  OrdersPagenated({
      this.currentPage, 
      this.totalPage, 
      this.error, 
      this.data,});

  OrdersPagenated.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    totalPage = json['totalPage'];
    error = json['error'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Order.fromJson(v));
      });
    }
  }
  int? currentPage=1;
  int? totalPage;
  String? error;
  List<Order>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPage'] = totalPage;
    map['error'] = error;
    map['data'] = data?.map((v) => v.toJson()).toList();
    return map;
  }

}