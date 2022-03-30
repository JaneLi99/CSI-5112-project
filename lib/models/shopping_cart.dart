import 'dart:math';

import 'package:csi5112/login/login_page.dart' as loginPage;
import 'package:csi5112/models/user.dart';
import 'package:flutter/foundation.dart';

import 'package:csi5112/models/product.dart';

UserModel currentUser = loginPage.currentUser;

class ShoppingCartModel with ChangeNotifier {
  List<ProductModel> products = [];
  double totalPrice = 0;
  List<int> shippingPrice = [10, 20, 50, 100];
  double paymentPrice = 0;
  int currentValue = 10;
  String userName = currentUser.userName;
  String address = currentUser.address;

  ShoppingCartModel() {
    calculateTotalPrice();
    notifyListeners();
  }

  add(ProductModel productModel) {
    final repetitiveProductId =
        products.indexWhere((element) => element.id == productModel.id);
    if (repetitiveProductId >= 0) {
      products[repetitiveProductId].quantity++;
    } else {
      products.add(productModel);
    }
    // print(productModel.toString());
    calculateTotalPrice();
    notifyListeners();
  }

  int calTotalQuantity() {
    int totalQuantity = 0;
    products.forEach((element) {
      totalQuantity += element.quantity;
    });
    return totalQuantity;
  }

  changeCurrentValue(v) {
    currentValue = v;
    calculateTotalPrice();
  }

  incrementQuantity(id) {
    var i = products.indexWhere((element) => element.id == id);
    if (i != -1) products[i].quantity++;
    calculateTotalPrice();
    // print(products.toString());
  }

  decrementQuantity(id) {
    var i = products.indexWhere((element) => element.id == id);
    if (i != -1) if (products[i].quantity > 1)
      products[i].quantity--;
    else if (i == 1) {
      removeProduct(id);
    }
    calculateTotalPrice();
    // print(products.toString());
  }

  removeProduct(id) {
    products.removeWhere((element) => element.id == id);
    calculateTotalPrice();
  }

  calculateTotalPrice() {
    totalPrice = 0;
    products.forEach((element) {
      totalPrice += element.quantity * element.price;
      var s = totalPrice.toStringAsFixed(2);
      totalPrice = double.parse(s);
    });
    calculatePaymentPrice();
  }

  calculatePaymentPrice() {
    paymentPrice = totalPrice + currentValue;
    var s = paymentPrice.toStringAsFixed(2);
    paymentPrice = double.parse(s);
    notifyListeners();
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.products.toString();
  }

  factory ShoppingCartModel.fromJson(final json) {
    return ShoppingCartModel();
  }
}
