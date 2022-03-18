import 'dart:convert';

import 'package:meta/meta.dart';

class ProductModel {
  int id;
  String name;
  String categoryName;
  String imgUrl;
  double price;
  int quantity;
  String description;
  bool added;
  ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.imgUrl,
    required this.price,
    required this.quantity,
    required this.description,
    this.added = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryName': categoryName,
      'imgUrl': imgUrl,
      'price': price,
      'quantity': quantity,
      'description': description,
      'added': added,
    };
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, categoryName: $categoryName, imgUrl: $imgUrl, price: $price, quantity: $quantity, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.categoryName == categoryName &&
        other.imgUrl == imgUrl &&
        other.price == price &&
        other.quantity == quantity;
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
