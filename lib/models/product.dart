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
  // ProductModel(this.id, this.name, this.categoryName, this.imgUrl, this.price,
  //     this.quantity, this.description);
  ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.imgUrl,
    required this.price,
    // required this.quantity,
    required this.inventory,
    required this.description,
    // this.added = false,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'categoryName': categoryName,
  //     'imgUrl': imgUrl,
  //     'price': price,
  //     'quantity': quantity,
  //     'description': description,
  //   };
  // }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['productId'],
      name: json['productName'],
      categoryName: json['category'],
      imgUrl: json['image'],
      price: json['price'],
      // quantity: json['inventory'],
      inventory: json['inventory'],
      description: json['description'],
    );
  }

  static List<ProductModel> fromListJson(List<dynamic> json) {
    List<ProductModel> result = [];
    for (Map<String, dynamic> d in json) {
      // print(json.length);
      // print(d.toString());
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

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is ProductModel &&
  //       other.id == id &&
  //       other.name == name &&
  //       other.categoryName == categoryName &&
  //       other.imgUrl == imgUrl &&
  //       other.price == price &&
  //       other.quantity == quantity;
  // }

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
