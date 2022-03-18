import 'package:csi5112/models/order.dart';
import 'package:csi5112/models/order_model_mock.dart';
import 'package:flutter/material.dart';

var OrderList = OrderListModel.orders;

class CustomerOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerOrdersState();
  }
}

class CustomerOrdersState extends State<CustomerOrders> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        height: 1500,
        alignment: Alignment.center,
        child: Container(
            color: Colors.yellow[50],
            padding: EdgeInsets.all(100.0),
            child: Column(
              children: [
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(80.0),
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
                    TableRow(
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
                    for (int i = 0; i < OrderList.length; i++)
                      OrderColumn(OrderList[i]),
                  ],
                ),
              ],
            )),
      )
    ]);
  }

  TableRow OrderColumn(OrderModel orderModel) {
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
                          title:
                              Text("Your invoice \n# ${orderModel.orderId}:"),
                          content: Text(
                              "User ID: \n${orderModel.userId}n\nOrder Time: \n${orderModel.orderDate}\n\nTotal Price: \n${orderModel.totalPrice}\n"),
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
}
