import 'dart:convert';

import 'package:csi5112/main.dart';
import 'package:csi5112/models/chatbox.dart';
import 'package:csi5112/models/order.dart';
import 'package:csi5112/models/product.dart';
<<<<<<< HEAD
=======
import 'package:csi5112/models/user.dart';
>>>>>>> a54d77b (Updated user setting)
import 'package:http/http.dart' as http;

class HttpGet {
  static Future<ProductModel> fetchProduct(String uri, String id) async {
    uri = uri.toString() + '/product/' + id;
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }

  static Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(MyApp.api + "/product"));
    if (response.statusCode == 200) {
      return ProductModel.fromListJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }

  static Future<List<OrderModel>> fetchOrders() async {
    final response = await http.get(Uri.parse(MyApp.api + "/order"));
    if (response.statusCode == 200) {
      return OrderModel.fromListJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }

  static Future<List<ChatBoxModel>> fetchChatbox() async {
    final response = await http.get(Uri.parse(MyApp.api + "/chatbox"));
    if (response.statusCode == 200) {
      return ChatBoxModel.fromListJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }
<<<<<<< HEAD
=======

  static Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(MyApp.api + "/user"));
    if (response.statusCode == 200) {
      return UserModel.fromListJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }
>>>>>>> a54d77b (Updated user setting)
}
