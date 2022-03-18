import 'package:csi5112/customer/CustomerMain.dart';
import 'package:csi5112/models/product.dart';
import 'package:csi5112/models/product_model_mock.dart';
import 'package:csi5112/models/product_models_mock.dart';
import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/shopping_cart/shopping_cart_page.dart';

import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

String currentCategory = "";
String currentItemName = "";
int id = 0;
int quantity = 1;

void main() {
  runApp(const CategoryItemsMain());
}

class CategoryItemsMain extends StatelessWidget {
  const CategoryItemsMain({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategorytMain(),
    );
  }
}

class CategorytMain extends StatefulWidget {
  @override
  State<CategorytMain> createState() => _CategorytMainState();
}

class _CategorytMainState extends State<CategorytMain> {
  List<ProductModel> items = ProductModels_Mock.products;

  List categoryList = [];
  List resultList = [];

  bool showFruit = true;
  bool showVegetables = false;
  bool showBeverage = false;

  int productCart = 0;

  generateCategoryList(List items) {
    categoryList.clear();
    for (int i = 0; i < items.length; i++) {
      if (!categoryList.contains(items[i].categoryName)) {
        categoryList.add(items[i].categoryName);
        // print(categoryList);
      }
    }
  }

  generateResultList(String c) {
    resultList.clear();
    for (int i = 0; i < items.length; i++) {
      if (items[i].categoryName == c) {
        resultList.add(items[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (resultList.length == 0) {
      resultList = [...items];
    }
    generateCategoryList(items);

    print(currentCategory);
    return mainStructure();
  }

  Scaffold mainStructure() {
    return Scaffold(
      body: Row(
        children: <Widget>[
          CategoryLeft(),
          Expanded(child: categoryRight()),
        ],
      ),
    );
  }

  Widget CategoryLeft() {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Let's Grocery",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            categorySelector(categoryList),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerMain()));
              },
              icon: Icon(Icons.arrow_left),
              label: Text("Back to My Account"),
            ),
          ],
        ),
      ),
    );
  }

  Widget categorySelector(List l) {
    return Column(
      children: [
        for (int i = 0; i < l.length; i++) generateCategorySelector(l[i])
      ],
    );
  }

  ListTile generateCategorySelector(String s) {
    return ListTile(
      onTap: () {
        setState(() {
          currentCategory = s;
          generateResultList(currentCategory);
        });
      },
      horizontalTitleGap: 0.0,
      leading: const Icon(Icons.category),
      title: Text(
        s,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget categoryRight() {
    return LayoutBuilder(builder: (context, costr) {
      var count = 4;
      if (costr.maxWidth > 1200) count = 8;
      return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      itemCount: resultList.length,
                      itemBuilder: (context, index) =>
                          cartView(resultList[index]),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, childAspectRatio: 1.3 / 1.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      actions: <Widget>[
        Container(
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Shoppingcart()));
                },
              ),
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                child: Text(
                  "$productCart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
      title: Text(
        "Check for more items",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget cartView(ProductModel productModel) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              currentItemName = productModel.name;
              showProductDetails(context);
            },
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productModel.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              currentItemName = productModel.name;
              showProductDetails(context);
            },
            child: Text(
              "${productModel.name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text("\$${productModel.price}"),
          Consumer<ShoppingCartModel>(
            builder: (context, value, state) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          Consumer<ShoppingCartModel>(
            builder: (context, value, child) => RaisedButton(
              color: !productModel.added ? Colors.orange : Colors.grey,
              child: Text(
                !productModel.added ? "Add to Cart" : "Added",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  productModel.added = !productModel.added;
                  if (productModel.added) {
                    productCart++;
                    value.add(productModel);
                  } else {
                    productCart--;
                    value.removeProduct(productModel.id);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  showProductDetails(BuildContext context) {
    String imgPath = "";
    double price = 0.0;
    String description = "";

    for (int i = 0; i < items.length; i++) {
      if (items[i].name == currentItemName) {
        imgPath = items[i].imgUrl;
        price = items[i].price;
        description = items[i].description;
      }
    }
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Item Details:"),
      insetPadding: EdgeInsets.zero,
      content: Container(
        height: 300,
        width: 300,
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.network(
              imgPath,
              height: 150,
              width: 150,
            ),
            Text("\n${currentItemName}\n\$${price}\n\n${description}"),
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(child: alert);
      },
    );
  }
}
