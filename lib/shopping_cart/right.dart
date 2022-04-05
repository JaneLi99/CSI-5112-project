import 'package:csi5112/checkout/checkout_main.dart';
import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/models/shopping_cart.dart' as shopping_cart;
import 'package:csi5112/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ShoppingCartModel shoppingCartModel

class RightVeiw extends StatefulWidget {
  @override
  _RightVeiwState createState() => _RightVeiwState();
}

class _RightVeiwState extends State<RightVeiw> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );

    return Consumer<shopping_cart.ShoppingCartModel>(
      builder: (context, shoppingCartModel, state) => Container(
        width: 400.0,
        padding: EdgeInsets.all(32.0),
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Summary",
              style: headingTextStyle,
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
                  "Items ${shoppingCartModel.products.length}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  "\$${shoppingCartModel.totalPrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              "Shipping",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: shoppingCartModel.currentValue,
                    onChanged: (v) {
                      shoppingCartModel.changeCurrentValue(v);
                    },
                    items: [
                      for (int dc in shoppingCartModel.shippingPrice)
                        DropdownMenuItem(
                          child: Text("Standard Delivery - \$$dc"),
                          value: dc,
                        ),
                    ],
                    //onChanged: (int? value) {  },
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Cost",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  "\$${shoppingCartModel.paymentPrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            // Spacer(),
            MaterialButton(
              minWidth: double.infinity,
              onPressed: () async {
                if (shoppingCartModel.products.length == 0) {
                  showCartEmptyAlert(context);
                } else {
                  HttpPost.postOrderData(shoppingCartModel);
                  shoppingCartModel.products.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(),
                    ),
                  );
                }
              },
              child: Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  showCartEmptyAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your cart is empty."),
          insetPadding: EdgeInsets.zero,
          content: Text("Please add something before checkout."),
        );
      },
    );
  }
}
