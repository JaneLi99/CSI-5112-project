import 'Merchant_Page_Structure.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryListState();
  }
}

class CategoryListState extends State<CategoryList> {
  int a = 1;

  bool ready = false;

  List items = [
    [1, "Apple", "10", "1"],
    [1, "Orange", "20", "2"],
    [1, "Banana", "30", "3"],
    [1, "Coconut", "40", "4"],
    [1, "Strawberry", "50", "5"],
    [2, "Srite", "100", "16"],
    [2, "Orange Juice", "200", "27"],
    [2, "Coke", "300", "38"],
    [2, "Pepsi", "400", "49"],
    [2, "Canada Dry", "500", "50"],
    [3, "Broccoli", "9", "8"],
    [3, "Tomato", "99", "88"],
    [3, "Potato", "999", "888"],
    [3, "Onion", "9999", "8888"],
    [3, "Ginger", "99999", "88888"],
  ];

  bool showRecentOrderList = false;
  List resultList = [];
  generateResultList(int index) {
    resultList.clear();
    for (int i = 0; i < items.length; i++) {
      if (items[i][0] == index) {
        resultList.add(items[i]);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      generateResultList(1);
      ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // generateResultList(2);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        CategoryList(),
        SizedBox(
          height: 50,
        ),
        itemList(),
        SizedBox(
          height: 20,
        ),
        TextButton(onPressed: () {}, child: Text("Update Inventory")),
        SizedBox(
          height: 50,
        ),
        Text("Add New Item:"),
        SizedBox(
          height: 10,
        ),
        addNewItemList(),
        TextButton(onPressed: () {}, child: Text("Add")),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                showRecentOrderList = !showRecentOrderList;
              });
            },
            child: Text("Recent Order:")),
        SizedBox(
          height: 10,
        ),
        if (showRecentOrderList) RecentOrderList(),
      ],
    ));
  }

  Widget CategoryList() {
    return Table(
        columnWidths: const {
          0: FixedColumnWidth(130.0),
          1: FixedColumnWidth(130.0),
          2: FixedColumnWidth(130.0),
        },
        border: TableBorder.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        children: [
          TableRow(children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    a = 1;
                    generateResultList(a);
                  });
                },
                child: Text("Category 1")),
            TextButton(
                onPressed: () {
                  setState(() {
                    a = 2;
                    generateResultList(a);
                  });
                },
                child: Text("Category 2")),
            TextButton(
                onPressed: () {
                  setState(() {
                    a = 3;
                    generateResultList(a);
                  });
                },
                child: Text("Category 3")),
          ]),
        ]);
  }

  Widget itemList() {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(150.0),
        3: FixedColumnWidth(200.0),
        4: FixedColumnWidth(200.0),
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
                  'Item',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Inventory',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Item Sold',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Operation: Add Inventory',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Operation: Remove Item',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[0][1]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[0][2]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[0][3]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Inventory",
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/remove.png",
                  height: 20,
                  width: 20,
                )),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[1][1]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[1][2]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[1][3]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Inventory",
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/remove.png",
                  height: 20,
                  width: 20,
                )),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[2][1]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[2][2]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[2][3]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Inventory",
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/remove.png",
                  height: 20,
                  width: 20,
                )),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[3][1]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[3][2]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[3][3]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Inventory",
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/remove.png",
                  height: 20,
                  width: 20,
                )),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[4][1]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[4][2]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${resultList[4][3]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Inventory",
              ),
            ),
          ),
          Container(
            height: 40,
            child: TextButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/remove.png",
                  height: 20,
                  width: 20,
                )),
          ),
        ]),
      ],
    );
  }

  Widget addNewItemList() {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(150.0),
        3: FixedColumnWidth(200.0),
        4: FixedColumnWidth(200.0),
      },
      border: TableBorder.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      children: [
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "Category ${a}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Item name"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Inventory"),
          ),
        ]),
      ],
    );
  }

  Widget RecentOrderList() {
    List OrderList = [
      [
        "01011fdasgrt",
        "2022/01/12",
        "apple * 3\nOrange * 2\nMilk * 4\n",
        "\$99.4"
      ],
      [
        "02fg903ss5fh",
        "2022/02/12",
        "Juice * 3\nOrange * 2\nPotato * 4\n",
        "\$15.3"
      ],
      [
        "01239bvj934s",
        "2022/03/12",
        "Tomato * 3\nOrange * 2\nGinger * 4\n",
        "\$68.8"
      ],
    ];

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(150.0),
        3: FixedColumnWidth(200.0),
        4: FixedColumnWidth(200.0),
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
                  'Customer ID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Order Time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Item Sold',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Total Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[0][0]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[0][1]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 60,
            child: Align(
              child: Text(
                "${OrderList[0][2]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[0][3]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[1][0]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[1][1]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 60,
            child: Align(
              child: Text(
                "${OrderList[1][2]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[1][3]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[2][0]}",
                textAlign: TextAlign.center,
                // style: TextStyle(height: 20),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[2][1]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 60,
            child: Align(
              child: Text(
                "${OrderList[2][2]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 40,
            child: Align(
              child: Text(
                "${OrderList[2][3]}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
