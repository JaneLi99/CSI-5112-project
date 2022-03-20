import 'package:csi5112/models/chatbox.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:http/http.dart';

import '../main.dart';
import '../models/product.dart';

class HttpPut {
  static Future<void> updateOrderData(
      ShoppingCartModel shoppingCartModel) async {
    final url = Uri.parse('https://localhost:7042/api/order/o001111');
    final headers = {"Content-type": "application/json"};
    final json =
        '{"orderId":"o001111","userId":"u0011111","orderDate":${DateTime.now()},"totalPrice":${shoppingCartModel.paymentPrice},"orderAddress":"33-186 Stewart Street"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> updateChatboxData(ChatBoxModel chatBoxModel) async {
    final url = Uri.parse(MyApp.api + "/chatbox/" + "${chatBoxModel.postId}");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"postId":"${chatBoxModel.postId}","question":"${chatBoxModel.question}","reply":"${chatBoxModel.reply}","postDate":"${chatBoxModel.postDate}"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> updateProductData(ProductModel productModel) async {
    final url = Uri.parse(MyApp.api + "/product/" + "${productModel.id}");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"productId":"${productModel.id}","productName":"${productModel.name}","category":"${productModel.categoryName}","price":${productModel.price},"inventory":${productModel.inventory},"quantity":1,"description":"${productModel.description}","image":"${productModel.imgUrl}"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }
}
