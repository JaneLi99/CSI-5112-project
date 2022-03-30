import 'package:csi5112/httprequest/get_data.dart';
import 'package:csi5112/models/order.dart';
import 'package:flutter/material.dart';
import 'Merchant_Main.dart';

late List<OrderModel> orderList;

String currentUser = "";
List resultList = [];
List userList = [];

class CustomerOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerOrdersState();
  }
}

class CustomerOrdersState extends State<CustomerOrders> {
  late Future<List<OrderModel>> preOrderList;

  @override
  void initState() {
    super.initState();
    preOrderList = HttpGet.fetchOrders();
  }

  generateResultList(String c) {
    resultList.clear();
    if (c == "") {
      resultList = [...orderList];
    } else {
      for (int i = 0; i < orderList.length; i++) {
        if (orderList[i].userId == c) {
          resultList.add(orderList[i]);
        }
      }
    }
  }

  generateUserList(List OrderList) {
    userList.clear();
    for (int i = 0; i < OrderList.length; i++) {
      if (!userList.contains(OrderList[i].userId)) {
        userList.add(OrderList[i].userId);
        // print(userList);
      }
    }
  }

  var headingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderModel>>(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        orderList = [...snapshot.data as List<OrderModel>];
        if (resultList.length == 0) {
          resultList = [...orderList];
        }
        generateUserList(orderList);
        if (resultList.length == 0) {
          resultList = [...orderList];
        }
        generateUserList(orderList);
        return ListView(shrinkWrap: true, children: [
          Container(
            height: 1200,
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.yellow[50],
              padding: EdgeInsets.all(32.0),
              child: Column(
                children: [
                  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Customer Order View",
                        style: headingTextStyle,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  UserSelector(),
                  Table(
                    columnWidths: const {
                      0: FixedColumnWidth(120.0),
                      1: FixedColumnWidth(80.0),
                      2: FixedColumnWidth(100.0),
                      3: FixedColumnWidth(100.0),
                      4: FixedColumnWidth(140.0),
                      5: FixedColumnWidth(100.0),
                    },
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    children: [
                      const TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          children: [
                            SizedBox(
                              height: 30.0,
                              child: Text(
                                'Order ID',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              'User ID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Order Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Total Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Order Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Print Invoice',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                      for (int i = 0; i < resultList.length; i++)
                        OrderRow(resultList[i]),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]);
      },
      future: preOrderList,
    );
  }

  TableRow OrderRow(OrderModel orderModel) {
    List<String> products = [];
    List<String> unitPrice = [];
    List<String> quantities = [];
    String orderDetails = "";

    products = orderModel.products.split(',');
    unitPrice = orderModel.unitPrice.split(',');
    quantities = orderModel.quantities.split(',');

    for (int j = 0; j < products.length - 1; j++) {
      String s =
          products[j] + " * " + quantities[j] + " @ " + unitPrice[j] + "\n";
      orderDetails = orderDetails + s;
    }
    return TableRow(children: [
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.orderId}",
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.userId}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 60,
        child: Align(
          child: Text(
            "${orderModel.orderDate}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.totalPrice}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.orderAddress}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Invoice # ${orderModel.orderId}:"),
                          content: Text(
                              "User Name: \n${orderModel.userId}\n\nOrder Time: \n${orderModel.orderDate}\n\nProducts: \n$orderDetails\n\nTotalPrice: \n${orderModel.totalPrice}\n"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
              child: Text("Print Invoice")),
        ),
      ),
    ]);
  }

  Widget UserSelector() {
    return Row(
      children: [
        for (var i = 0; i < userList.length; i++)
          generateUserSelector(userList[i])
      ],
    );
  }

  Widget generateUserSelector(String s) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {
            setState(() {
              currentUser = s;
              generateResultList(s);
            });
          },
          child: Text(
            s,
            textAlign: TextAlign.left,
          )),
    );
  }
}
