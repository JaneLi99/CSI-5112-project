import 'dart:convert';

import 'package:meta/meta.dart';

class ProductModel {
  String id;
  String name;
  String categoryName;
  String imgUrl;
  double price;
  int quantity = 1;
  int inventory;
  String description;
  bool added = false;
  ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.imgUrl,
    required this.price,
    required this.inventory,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['productName'],
      categoryName: json['category'],
      imgUrl: json['image'],
      price: json['price'],
      inventory: json['inventory'],
      description: json['description'],
    );
  }

  static List<ProductModel> fromListJson(List<dynamic> json) {
    List<ProductModel> result = [];
    for (Map<String, dynamic> d in json) {
      ProductModel productModel = ProductModel.fromJson(d);
      // print(productModel.toString());
      result.add(productModel);
    }
    return result;
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, categoryName: $categoryName, imgUrl: $imgUrl, price: $price, quantity: $quantity, inventory: $inventory, description: $description)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        categoryName.hashCode ^
        imgUrl.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
