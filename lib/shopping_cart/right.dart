import 'package:csi5112/checkout/checkout_main.dart';
import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightVeiw extends StatefulWidget {
  @override
  _RightVeiwState createState() => _RightVeiwState();
}

class _RightVeiwState extends State<RightVeiw> {
  @override
  Widget build(BuildContext context) {
    var headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    return Consumer<ShoppingCartModel>(
<<<<<<< HEAD
      builder: (context, ShoppingCartModel, state) => Container(
=======
      builder: (context, shoppingCartModel, state) => Container(
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                  "Items ${ShoppingCartModel.products.length}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  "\$${ShoppingCartModel.totalPrice}",
=======
                  "Items ${shoppingCartModel.products.length}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  "\$${shoppingCartModel.totalPrice}",
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                    value: ShoppingCartModel.currentValue,
                    onChanged: (v) {
                      ShoppingCartModel.changeCurrentValue(v);
                    },
                    items: [
                      for (int dc in ShoppingCartModel.shippingPrice)
=======
                    value: shoppingCartModel.currentValue,
                    onChanged: (v) {
                      shoppingCartModel.changeCurrentValue(v);
                    },
                    items: [
                      for (int dc in shoppingCartModel.shippingPrice)
>>>>>>> b28b353 (Frontend for Phase 2)
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
            Text(
              "Promo Code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your code",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: InputBorder.none,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Apply",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              color: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
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
<<<<<<< HEAD
                  "\$${ShoppingCartModel.paymentPrice}",
=======
                  "\$${shoppingCartModel.paymentPrice}",
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                postOrderData(ShoppingCartModel);
=======
                HttpPost.postOrderData(shoppingCartModel);
                shoppingCartModel.products.clear();
>>>>>>> b28b353 (Frontend for Phase 2)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Checkout(),
                  ),
                );
                // print(ShoppingCartModel.toString());
                // final cartInfor =
                //     (Provider.of<ShoppingCartModel>(context, listen: false));
                // cartInfor.notifyListeners();
                // print(cartInfor.paymentPrice);
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
}
