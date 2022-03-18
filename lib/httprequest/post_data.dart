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
}
