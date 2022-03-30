import 'package:csi5112/models/chatbox.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/models/user.dart';
import 'package:http/http.dart';

import '../main.dart';

class HttpPost {
  static Future<void> postOrderData(ShoppingCartModel shoppingCartModel) async {
    String productName = "";
    String productPrice = "";
    String productQuantity = "";

    for (int i = 0; i < shoppingCartModel.products.length; i++) {
      productName = productName + shoppingCartModel.products[i].name + ",";
      productPrice =
          productPrice + "${shoppingCartModel.products[i].price}" + ",";
      productQuantity =
          productQuantity + "${shoppingCartModel.products[i].quantity}" + ",";
      // productPrice.add(shoppingCartModel.products[i].price);
      // productQuantity.add(shoppingCartModel.products[i].quantity);
    }

    print(productName);
    print(productPrice);
    print(productQuantity);
    final url = Uri.parse(MyApp.api + "/order");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"userId":"${shoppingCartModel.userName}","orderDate":"${DateTime.now()}","totalPrice":${shoppingCartModel.totalPrice},"orderAddress":"${shoppingCartModel.address}","products":"${productName}","unitPrice":"${productPrice}","quantities":"${productQuantity}"}';
    print(json);
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> postProductData(ProductModel productModel) async {
    final url = Uri.parse(MyApp.api + "/product");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"productName":"${productModel.name}","category":"${productModel.categoryName}","price":${productModel.price},"inventory":${productModel.inventory},"quantity":${productModel.quantity},"description":"${productModel.description}","image":"${productModel.imgUrl}"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> postChatboxData(ChatBoxModel chatBoxModel) async {
    // print(shoppingCartModel.toString());
    final url = Uri.parse(MyApp.api + "/chatbox");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"question":"${chatBoxModel.question}","reply":"${chatBoxModel.reply}","postDate":"${chatBoxModel.postDate}"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> postUserData(UserModel userModel) async {
    // print(shoppingCartModel.toString());
    final url = Uri.parse(MyApp.api + "/user");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"userName":"${userModel.userName}","password":"${userModel.password}","phoneNumber":"${userModel.phoneNumber}","address":"${userModel.address}"}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }
}
