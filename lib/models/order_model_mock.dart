import 'package:csi5112/models/order.dart';
import 'package:flutter/foundation.dart';

class OrderListModel with ChangeNotifier {
  static List<OrderModel> orders = [
    OrderModel(
      orderId: "o0001",
      userId: "u0001",
      orderDate: "2021-12-31",
      totalPrice: 34.99,
      orderAddress: "1212-171 Lees Ave, Ottawa, ON",
    ),
    OrderModel(
      orderId: "o0002",
      userId: "u0002",
      orderDate: "2022-02-17",
      totalPrice: 24.59,
      orderAddress: "27-187 Stewart Street, Ottawa, ON",
    ),
    OrderModel(
      orderId: "o0003",
      userId: "u0003",
      orderDate: "2022-03-05",
      totalPrice: 99.59,
      orderAddress: "1207-169 Lees Ave, Ottawa, ON",
    ),
  ];
}
