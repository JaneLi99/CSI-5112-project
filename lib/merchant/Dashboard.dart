import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/httprequest/delete_data.dart';
import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/httprequest/put_data.dart';
import 'package:csi5112/login/login_page.dart';
import 'package:csi5112/models/product.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter/foundation.dart';
import '../main.dart';
import 'package:csi5112/httprequest/get_data.dart';

import 'Merchant_Main.dart';

List<ProductModel> items = [];
String idCounter = "3";
String currentCategory = "";

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  // Category number, item name, inventory, description

  List resultList = [];
  List categoryList = [];
  List<String> productIds = [];

  bool isANumber = true;
  RegExp digitValidator = RegExp("[0-9]+");

  late Future<List<ProductModel>> products;

  generateResultList(String category) {
    resultList.clear();
    if (category == "") {
      resultList = [...items];
    } else {
      for (int i = 0; i < items.length; i++) {
        if (items[i].categoryName == category) {
          resultList.add(items[i]);
          productIds.add(items[i].id);
        }
      }
      // productIds = List.from(resultList.id);
      // print(productIds);
    }
  }

  generateCategoryList(List items) {
    categoryList.clear();
    for (int i = 0; i < items.length; i++) {
      if (!categoryList.contains(items[i].categoryName)) {
        categoryList.add(items[i].categoryName);
        // print(categoryList);
      }
    }
  }

  addProduct(ProductModel newProduct) {
    bool existed = false;
    for (int i = 0; i < items.length; i++) {
      if (items[i].name == newProduct.name) {
        items[i].inventory = items[i].inventory + newProduct.inventory;
        existed = true;
        break;
      }
    }
    if (!existed) {
      items.add(newProduct);
      HttpPost.postProductData(newProduct);
      var idCounterInt = int.parse(idCounter);
      idCounterInt++;
      idCounter = idCounterInt.toString();
    }
  }

  var headingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );
  var subHeadingTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
  );

  @override
  void initState() {
    super.initState();
    products = HttpGet.fetchProducts();
    // print(products);
  }

  @override
  Widget build(BuildContext context) {
    /**/
    return FutureBuilder<List<ProductModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        }
        items = [...snapshot.data as List<ProductModel>];
        if (resultList.length == 0) {
          resultList = [...snapshot.data as List<ProductModel>];
        }

        generateCategoryList(items);

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 3000),
          child: ListView(
            shrinkWrap: true,
            children: [
              DashboardContent(),
            ],
          ),
        );
      },
      future: products,
    );
  }

  Widget DashboardContent() {
    return Container(
      color: Colors.yellow[50],
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Merchant Managment",
                style: headingTextStyle,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            children: [
              CategorySelector(),
            ], // put in middle
          ),
          itemList(),
          addNewItemList(),
          if (currentCategory == "")
            Text("Please select a category to delete."),
          if (currentCategory != "")
            TextButton(
                onPressed: () {
                  // HttpDelete.deleteProduct();

                  setState(() {
                    for (int i = 0; i < productIds.length; i++) {
                      print(resultList[i]);
                      HttpDelete.deleteProduct(resultList[i]);
                      // print(productIds);
                    }
                    currentCategory = "";
                    generateResultList(currentCategory);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MerchantMain()));
                },
                child: Text("Delete ${currentCategory} category")),
        ],
      ),
    );
  }

  Widget CategorySelector() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < categoryList.length; i++)
          generateCategorySelector(categoryList[i])
      ],
    );
  }

  TextButton generateCategorySelector(String s) {
    return TextButton(
        onPressed: () {
          setState(() {
            currentCategory = s;
            generateResultList(s);
          });
        },
        child: Text(
          s,
          textAlign: TextAlign.left,
        ));
  }

  Widget itemList() {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(80.0),
        1: FixedColumnWidth(100.0),
        2: FixedColumnWidth(150.0),
        3: FixedColumnWidth(120.0),
        4: FixedColumnWidth(80.0),
        5: FixedColumnWidth(380.0),
        6: FixedColumnWidth(60.0),
      },
      border: TableBorder.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            children: [
              SizedBox(
                height: 30.0,
                child: Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Item',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Picture',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Inventory',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Item Price',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Item Description',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Remove Item',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
        // TableRow(),

        for (int i = 0; i < resultList.length; i++)
          GenerateItemTableRow(resultList[i])
      ],
    );
  }

  TableRow GenerateItemTableRow(ProductModel p) {
    TextEditingController updateInventoryInput = TextEditingController();

    void setValidator(valid) {
      setState(() {
        isANumber = valid;
        print(isANumber);
      });
    }

    return TableRow(children: [
      Container(
        height: 60,
        child: Align(
          child: Text(
            p.categoryName,
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
        height: 60,
        child: Align(
          child: Text(
            p.name,
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
        height: 80,
        child: Align(
          child: Column(
            children: [
              Image.network(
                p.imgUrl,
                height: 60,
                width: 90,
              ),
            ],
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
            child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 50,
              child: TextField(
                controller: updateInventoryInput,
                decoration: InputDecoration(
                  hintText: "${p.inventory}",
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 70,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (digitValidator.hasMatch(updateInventoryInput.text)) {
                        p.inventory = int.parse(updateInventoryInput.text);
                        generateResultList("");
                        showUpdateSuccessAlert(context);
                      } else {
                        showUpdateFailAlert(context);
                      }
                      HttpPut.updateProductData(p);
                    });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MerchantMain()));
                  },
                  child: Text(
                    "Update",
                    textAlign: TextAlign.left,
                  )),
            ),
          ],
        )),
      ),
      Container(
        height: 60,
        child: Align(
          child: Text(
            "${p.price}",
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
        height: 80,
        child: Align(
          child: Text(
            p.description,
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
          height: 60,
          child: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              HttpDelete.deleteProduct(p);
              items.remove(p);
              generateCategoryList(items);
              setState(() {
                showDeleteAlert(context);
                // print(currentCategory);
                generateResultList(currentCategory);
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MerchantMain()));
            },
          )),
    ]);
  }

  Widget addNewItemList() {
    TextEditingController addItemCategory = TextEditingController();
    TextEditingController addItemName = TextEditingController();
    TextEditingController addItemImagePath = TextEditingController();
    TextEditingController addItemPrice = TextEditingController();
    TextEditingController addItemInventory = TextEditingController();
    TextEditingController addItemDescription = TextEditingController();
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FixedColumnWidth(80.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(150.0),
            3: FixedColumnWidth(120.0),
            4: FixedColumnWidth(80.0),
            5: FixedColumnWidth(380.0),
            6: FixedColumnWidth(60.0),
          },
          border: TableBorder.all(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          children: [
            TableRow(children: [
              TextField(
                decoration: InputDecoration(labelText: "Item Category"),
                controller: addItemCategory,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Item name"),
                controller: addItemName,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Image Path"),
                controller: addItemImagePath,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Inventory"),
                controller: addItemInventory,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Price"),
                controller: addItemPrice,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Item Description"),
                controller: addItemDescription,
              ),
              IconButton(
                icon: Icon(Icons.add_business),
                onPressed: () {
                  setState(() {
                    ProductModel newProduct = ProductModel(
                        id: idCounter,
                        name: addItemName.text,
                        categoryName: addItemCategory.text,
                        imgUrl: addItemImagePath.text,
                        price: double.parse(addItemPrice.text),
                        description: addItemDescription.text,
                        inventory: int.parse(addItemInventory.text));
                    // print(newProduct);
                    addProduct(newProduct);
                    generateResultList("");
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MerchantMain()));
                },
              ),
            ]),
          ],
        ),
      ],
    );
  }

  showUpdateSuccessAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Attention:"),
          content: Text("Your inventory has been updated"),
        );
      },
    );
  }

  showUpdateFailAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error:"),
          content: Text("Please enter a number."),
        );
      },
    );
  }

  showDeleteAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Attention:"),
          content: Text("The item has been deleted"),
        );
      },
    );
  }

  // updateBackend() {}
}
