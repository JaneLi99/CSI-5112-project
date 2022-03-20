import 'package:csi5112/models/product.dart';
import 'package:http/http.dart';

import '../main.dart';

class HttpDelete {
  static Future<void> deleteProduct(ProductModel productModel) async {
    // print(shoppingCartModel.toString());
    final url = Uri.parse(MyApp.api + "/product/" + "${productModel.id}");
    final headers = {"Content-type": "application/json"};
    final response = await delete(url, headers: headers);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
  }

  // static Future<void> deleteByCategory(List productIds) async {
  //   // print(shoppingCartModel.toString());
  //   final url = Uri.parse(MyApp.api + "/delete/category");
  //   final headers = {"Content-type": "application/json"};
  //   final response = await delete(url, headers: headers);
  //   print('Status code: ${response.statusCode}');
  //   print('Headers: ${response.headers}');
  // }
}
