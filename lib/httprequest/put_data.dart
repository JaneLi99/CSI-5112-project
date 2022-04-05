import 'package:csi5112/models/chatbox.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/models/user.dart';
import 'package:http/http.dart';

import '../main.dart';
import '../models/product.dart';

class HttpPut {
  static Future<void> updateChatboxData(ChatBoxModel chatBoxModel) async {
    final url = Uri.parse(MyApp.api + "/chatbox");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"id":"${chatBoxModel.postId}","question":"${chatBoxModel.question}","reply":"${chatBoxModel.reply}","postDate":"${chatBoxModel.postDate}"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> updateProductData(ProductModel productModel) async {
    final url = Uri.parse(MyApp.api + "/product");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"id":"${productModel.id}","productName":"${productModel.name}","category":"${productModel.categoryName}","price":${productModel.price},"inventory":${productModel.inventory},"quantity":1,"description":"${productModel.description}","image":"${productModel.imgUrl}"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  static Future<void> updateUserData(UserModel userModel) async {
    final url = Uri.parse(MyApp.api + "/user");
    final headers = {"Content-type": "application/json"};
    final json =
        '{"id":"${userModel.userId}","password":"${userModel.password}","userName":"${userModel.userName}","phoneNumber":"${userModel.phoneNumber}","address":"${userModel.address}"}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }
}
