import 'package:csi5112/shopping_cart/product.dart';
import 'package:csi5112/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel productModel;
  const ProductItemView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 80,
                // color: Colors.lightBlue,
                // child: Image.asset('pizza.png', fit: BoxFit.fill),
                child: Image.network(
                  productModel.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      productModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Text(
                  //   productModel.name,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      productModel.categoryName,
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  // Text(
                  //   productModel.categoryName,
                  //   style: TextStyle(
                  //     color: Colors.orange,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      context
                          .read<ShoppingCartProvider>()
                          .removeProduct(productModel.id);
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Consumer<ShoppingCartProvider>(
            builder: (context, value, state) => Row(
              children: [
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      value.decrementQuantity(productModel.id);
                    }),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  )),
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                  child: Text(productModel.quantity.toString()),
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      value.incrementQuantity(productModel.id);
                    }),
              ],
            ),
          ),
          Text(
            "\$${productModel.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$${double.parse((productModel.price * productModel.quantity).toStringAsFixed(2))}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
