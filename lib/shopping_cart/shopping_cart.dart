import 'package:flutter/foundation.dart';

import 'package:csi5112/shopping_cart/product.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
        id: 0,
        name: "Orange",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056__340.jpg",
        price: 0.99,
        quantity: 1),
    ProductModel(
        id: 1,
        name: "Coke",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2015/01/08/04/18/box-592367__480.jpg",
        price: 1.99,
        quantity: 1),
    ProductModel(
        id: 2,
        name: "Ginger",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/10/13/15/50/ginger-1738098__340.jpg",
        price: 2.49,
        quantity: 1),
  ];
  double totalPrice = 0;
  List<int> shippingPrice = [10, 20, 50, 100];
  double paymentPrice = 0;
  int currentValue = 10;
  ShoppingCartProvider() {
    calculateTotalPrice();
  }

  changeCurrentValue(v) {
    currentValue = v;
    calculateTotalPrice();
  }

  incrementQuantity(id) {
    var i = products.indexWhere((element) => element.id == id);
    if (i != -1) products[i].quantity++;
    calculateTotalPrice();
  }

  decrementQuantity(id) {
    var i = products.indexWhere((element) => element.id == id);
    if (i != -1) if (products[i].quantity > 1) products[i].quantity--;
    calculateTotalPrice();
  }

  removeProduct(id) {
    products.removeAt(id);
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
}
