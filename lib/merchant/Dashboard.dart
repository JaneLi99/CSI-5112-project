import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/models/product.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter/foundation.dart';
import '../models/product_models_mock.dart';

List items = ProductModels_Mock.products;
int idCounter = 3;
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

  bool isANumber = true;
  RegExp digitValidator = RegExp("[0-9]+");

  generateResultList(String c) {
    resultList.clear();
    if (c == "") {
      resultList = [...items];
    } else {
      for (int i = 0; i < items.length; i++) {
        if (items[i].categoryName == c) {
          resultList.add(items[i]);
        }
      }
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
        items[i].quantity = items[i].quantity + newProduct.quantity;
        existed = true;
        break;
      }
    }
    if (!existed) {
      items.add(newProduct);
      idCounter++;
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
  Widget build(BuildContext context) {
    // generateResultList(currentCategory);
    // print(items.length);

    if (resultList.length == 0) {
      resultList = [...items];
    }
    generateCategoryList(items);

    return ListView(children: <Widget>[
      Container(
        height: 1500,
        alignment: Alignment.center,
        child: DashboardContent(),
      )
    ]);
    /**/
  }

  Widget OriginalDashboard() {
    return Container(
      width: 900,
      color: Colors.yellow[50],
      padding: EdgeInsets.all(16.0),
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
          Row(),
        ],
      ),
    );
  }

  Widget DashboardContent() {
    return Container(
      width: 900,
      color: Colors.yellow[50],
      padding: EdgeInsets.all(16.0),
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
          if (currentCategory != "")
            TextButton(
                onPressed: () {
                  for (int i = 0; i < items.length; i) {
                    if (items[i].categoryName == currentCategory) {
                      items.removeAt(i);
                      continue;
                    }
                    i++;
                  }
                  setState(() {
                    currentCategory = "";
                    generateResultList(currentCategory);
                  });
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
        1: FixedColumnWidth(120.0),
        2: FixedColumnWidth(200.0),
        3: FixedColumnWidth(120.0),
        4: FixedColumnWidth(120.0),
        5: FixedColumnWidth(50.0),
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
          child: Column(
            children: [
              Image.network(
                p.imgUrl,
                height: 40,
                width: 40,
              ),
              Text(
                p.name,
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
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
              height: 60,
              width: 100,
              child: TextField(
                controller: updateInventoryInput,
                // keyboardType: TextInputType.number,
                // onChanged: (inputValue) {
                //   if (inputValue.isEmpty ||
                //       digitValidator.hasMatch(inputValue)) {
                //     setValidator(true);
                //   } else {
                //     setValidator(false);
                //   }
                //   setState(() {});
                // },
                decoration: InputDecoration(
                  hintText: "${p.quantity}",
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 70,
              child: TextButton(
                  onPressed: () {
                    if (digitValidator.hasMatch(updateInventoryInput.text)) {
                      p.quantity = int.parse(updateInventoryInput.text);
                      generateResultList("");
                      showUpdateSuccessAlert(context);
                    } else {
                      showUpdateFailAlert(context);
                    }
                    setState(() {});
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
        height: 60,
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
              items.remove(p);
              generateCategoryList(items);
              setState(() {
                showDeleteAlert(context);
                // print(currentCategory);
                generateResultList(currentCategory);
              });
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
            0: FixedColumnWidth(120.0),
            1: FixedColumnWidth(120.0),
            2: FixedColumnWidth(120.0),
            3: FixedColumnWidth(120.0),
            4: FixedColumnWidth(120.0),
            5: FixedColumnWidth(120.0),
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
                // keyboardType: TextInputType.number,
                // onChanged: (inputValue) {
                //   print(inputValue);
                //   if (inputValue.isEmpty ||
                //       digitValidator.hasMatch(inputValue)) {
                //     setValidator(true);
                //   } else {
                //     setValidator(false);
                //   }
                //   setState(() {});
                // },
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
                decoration: InputDecoration(labelText: "Price"),
                controller: addItemPrice,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Inventory"),
                controller: addItemInventory,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Item Description"),
                controller: addItemDescription,
              ),
            ]),
          ],
        ),
        TextButton(
            onPressed: () {
              setState(() {
                // print(addItemCategory.text);
                // print(addItemName.text);
                // print(addItemImagePath.text);
                // print(addItemInventory.text);
                // print(addItemDescription.text);
                ProductModel newProduct = ProductModel(
                    id: idCounter,
                    name: addItemName.text,
                    categoryName: addItemCategory.text,
                    imgUrl: addItemImagePath.text,
                    price: double.parse(addItemPrice.text),
                    description: addItemDescription.text,
                    quantity: int.parse(addItemInventory.text));
                // print(newProduct);
                addProduct(newProduct);
                generateResultList("");
              });
            },
            child: Text("Add Inventory")),
      ],
    );
  }

  showUpdateSuccessAlert(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog succeed = AlertDialog(
      title: Text("Attention:"),
      content: Text("Your inventory has been updated"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return succeed;
      },
    );
  }

  showUpdateFailAlert(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog fail = AlertDialog(
      title: Text("Error:"),
      content: Text("Please enter a number."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return fail;
      },
    );
  }

  showDeleteAlert(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attention:"),
      content: Text("The item has been deleted"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// TextButton deleteCategory() {
//   return 
// }

/*
class showDeleteAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
  }
}*/