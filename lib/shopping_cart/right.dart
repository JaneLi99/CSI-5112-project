import 'package:csi5112/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightVeiw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    return Consumer<ShoppingCartProvider>(
      builder: (context, value, state) => Container(
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
                  "Items ${value.products.length}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  "\$${value.totalPrice}",
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
                    value: value.currentValue,
                    onChanged: (v) {
                      value.changeCurrentValue(v);
                    },
                    items: [
                      for (int dc in value.shippingPrice)
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
                  "\$${value.paymentPrice}",
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
              onPressed: () {},
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
