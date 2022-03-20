<<<<<<< HEAD
import 'package:csi5112/models/shopping_cart.dart';
import 'package:http/http.dart';

Future<void> postOrderData(ShoppingCartModel shoppingCartModel) async {
  // print(shoppingCartModel.toString());
  final url = Uri.parse('https://localhost:7042/api/order/o00111111');
  final headers = {"Content-type": "application/json"};
  final json =
      '{"orderId":"o001111112222","userId":"u0011111","orderDate":"","totalPrice":${shoppingCartModel.paymentPrice},"orderAddress":"33-186 Stewart Street"}';
  final response = await post(url, headers: headers, body: json);
  print('Status code: ${response.statusCode}');
  print('Headers: ${response.headers}');
  print('Body: ${response.body}');
}

Future<void> updateOrderData(ShoppingCartModel shoppingCartModel) async {
  final url = Uri.parse('https://localhost:7042/api/order/o001111');
  final headers = {"Content-type": "application/json"};
  final json =
      '{"orderId":"o001111","userId":"u0011111","orderDate":${DateTime.now()},"totalPrice":${shoppingCartModel.paymentPrice},"orderAddress":"33-186 Stewart Street"}';
  final response = await put(url, headers: headers, body: json);
  print('Status code: ${response.statusCode}');
  print('Headers: ${response.headers}');
  print('Body: ${response.body}');
=======
import 'package:csi5112/models/chatbox.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:http/http.dart';

import '../main.dart';

class HttpPost {
  static Future<void> postOrderData(ShoppingCartModel shoppingCartModel) async {
    // print(shoppingCartModel.toString());
    final url = Uri.parse(MyApp.api + "/order/" + "11111");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"orderId":"11111","userId":"u0011111","orderDate":"${DateTime.now()}","totalPrice":${shoppingCartModel.paymentPrice},"orderAddress":"33-186 Stewart Street"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> postProductData(ProductModel productModel) async {
    final url = Uri.parse(MyApp.api + "/product/" + "${productModel.id}");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"productId":"${productModel.id}","productName":"${productModel.name}","category":"${productModel.categoryName}","price":${productModel.price},"inventory":${productModel.inventory},"quantity":${productModel.quantity},"description":"${productModel.description}","image":"${productModel.imgUrl}"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> postChatboxData(ChatBoxModel chatBoxModel) async {
    // print(shoppingCartModel.toString());
    final url = Uri.parse(MyApp.api + "/chatbox/" + "${chatBoxModel.postId}");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"postId":"${chatBoxModel.postId}","question":"${chatBoxModel.question}","reply":"${chatBoxModel.reply}","postDate":"${chatBoxModel.postDate}"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  // static Future<void> postProductList(List<ProductModel> l) async {
  //   final url = Uri.parse(MyApp.api + "/product/");
  //   final headers = {"Content-type": "application/json"};
  //   final int id = 0;
  //   final String name = "name";
  //   final String categoryName = "cate";
  //   final double price = 9.99;
  //   final int inventory = 5;
  //   final int quantity = 9;
  //   final String description = "added";
  //   final String imgUrl = "aa";
  //   final json =
  //       '{"productId":"${id}","productName":"${name}","category":"${categoryName}","price":${price},"inventory":${inventory},"quantity":${quantity},"description":"${description}","image":"${imgUrl}"}';
  //   final response = await post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Headers: ${response.headers}');
  //   print('Body: ${response.body}');
  // }
>>>>>>> b28b353 (Frontend for Phase 2)
}
