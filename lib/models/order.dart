import 'dart:convert';

import 'package:meta/meta.dart';

class OrderModel {
  String orderId;
  String userId;
  String orderDate;
  double totalPrice;
  String orderAddress;
  OrderModel({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.totalPrice,
    required this.orderAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "userId": userId,
      "orderDate": orderDate,
      "totalPrice": totalPrice,
      "orderAddress": orderAddress,
    };
  }

  @override
  String toString() {
    return 'OrderModel(orderId : $orderId, userId: $userId, orderDate: $orderDate, totalPrice: $totalPrice, orderAddress: $orderAddress,)';
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      userId: json['userId'],
      orderDate: json['orderDate'],
      totalPrice: json['totalPrice'],
      orderAddress: json['orderAddress'],
    );
  }

  static List<OrderModel> fromListJson(List<dynamic> json) {
    List<OrderModel> result = [];
    for (Map<String, dynamic> d in json) {
      OrderModel productModel = OrderModel.fromJson(d);
      result.add(productModel);
    }
    return result;
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is OrderModel &&
  //       other.orderId == orderId &&
  //       other.userId == userId &&
  //       other.orderDate == orderDate &&
  //       other.totalPrice == totalPrice &&
  //       other.orderAddress == orderAddress;
  // }

  @override
  int get hashCode {
    return orderId.hashCode ^
        userId.hashCode ^
        orderDate.hashCode ^
        totalPrice.hashCode ^
        orderAddress.hashCode;
  }
}
