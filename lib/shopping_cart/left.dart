import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/shopping_cart/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftVeiw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    var subHeadingTextStyle = const TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
    );
    return ListView(
        // shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 1200,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    "Shopping Cart",
                    style: headingTextStyle,
                  ),
                  Consumer<ShoppingCartModel>(
                    builder: (context, value, state) => Text(
                      "${value.products.length} Items",
                      style: headingTextStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Details",
                        style: subHeadingTextStyle,
                      ),
                      Text(
                        "Quantity",
                        style: subHeadingTextStyle,
                      ),
                      Text(
                        "Price",
                        style: subHeadingTextStyle,
                      ),
                      Text(
                        "Total",
                        style: subHeadingTextStyle,
                      ),
                    ],
                  ),
                  Consumer<ShoppingCartModel>(
                    builder: (context, value, state) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ProductItemView(
                          productModel: value.products[index],
                        ),
                        itemCount: value.products.length,
                        // shrinkWrap: true,
                      );
                    },
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryHome()));
                      },
                      icon: Icon(Icons.arrow_left),
                      label: Text("Continue Shopping")),
                ],
              ),
            ),
          ),
        ]);
  }
}
