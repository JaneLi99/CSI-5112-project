import 'dart:convert';

import 'package:csi5112/models/product.dart';
import 'package:http/http.dart' as http;

class HttpGet {
  static Future<ProductModel> fetchProduct(String uri, String id) async {
    uri = uri.toString() + '/' + id;
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }

  static Future<List<ProductModel>> fetchProducts(String uri) async {
    final response =
        await http.get(Uri.parse("https://localhost:7042/api/product"));
    if (response.statusCode == 200) {
      return ProductModel.fromListJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Failed");
    }
  }
}
