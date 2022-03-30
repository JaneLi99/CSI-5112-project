import 'dart:convert';

import 'package:meta/meta.dart';

class OrderModel {
  String orderId;
  String userId;
  String orderDate;
  double totalPrice;
  String orderAddress;
  String products;
  String quantities;
  String unitPrice;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.totalPrice,
    required this.orderAddress,
    required this.products,
    required this.quantities,
    required this.unitPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "userId": userId,
      "orderDate": orderDate,
      "totalPrice": totalPrice,
      "orderAddress": orderAddress,
      "products": products,
      "quantities": quantities,
      "unitPrice": unitPrice
    };
  }

  @override
  String toString() {
    return 'OrderModel(orderId : $orderId, userId: $userId, orderDate: $orderDate, totalPrice: $totalPrice, orderAddress: $orderAddress, products: $products, quantities: $quantities, unitPrice: $unitPrice)';
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['id'],
        userId: json['userId'],
        orderDate: json['orderDate'],
        totalPrice: json['totalPrice'],
        orderAddress: json['orderAddress'],
        products: json['products'],
        unitPrice: json['unitPrice'],
        quantities: json['quantities']);
  }

  static List<OrderModel> fromListJson(List<dynamic> json) {
    List<OrderModel> result = [];
    for (Map<String, dynamic> d in json) {
      OrderModel orderModel = OrderModel.fromJson(d);
      result.add(orderModel);
    }
    return result;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        userId.hashCode ^
        orderDate.hashCode ^
        totalPrice.hashCode ^
        orderAddress.hashCode;
  }
}
