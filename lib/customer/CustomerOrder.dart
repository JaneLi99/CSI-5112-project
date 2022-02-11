import 'package:flutter/material.dart';

class CustomerOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(top: 10.0, left: 100),
                      child: const Text(
                        "Your Account -> Your orders",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      padding: EdgeInsets.only(top: 10, left: 100),
                      child: const Text(
                        "Your orders",
                        textScaleFactor: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          RecentOrderList(),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Print Invoice"),
            height: 50.0,
            color: Colors.blueGrey,
            textColor: Colors.white,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer Homepage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(214, 50, 58, 65),
      ),
      body: container,
    );
  }

  Widget RecentOrderList() {
    List OrderList = [
      ["01011fdasgrt", "2022/01/12", "65.93", "Finish"],
      ["02fg903ss5fh", "2022/02/12", "183.02", "Finsh"],
      ["01239bvj934s", "2022/03/12", "231.23", "In Progress"],
    ];

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(150.0),
        3: FixedColumnWidth(200.0),
        4: FixedColumnWidth(100.0),
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
                'Order Time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Order Price',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Order Status',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Invoice',
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
            height: 40,
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
          Container(
              height: 40,
              child: MaterialButton(
                onPressed: () {},
                child: Text("Print Invoice"),
                minWidth: 50,
                height: 40.0,
                color: Colors.white,
                textColor: Colors.black,
              )),
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
            height: 40,
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
          Container(
              height: 40,
              child: MaterialButton(
                onPressed: () {},
                child: Text("Print Invoice"),
                height: 40.0,
                color: Colors.white,
                textColor: Colors.black,
              )),
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
            height: 40,
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
          Container(
              height: 40,
              child: MaterialButton(
                onPressed: () {},
                child: Text("Print Invoice"),
                height: 40.0,
                color: Colors.white,
                textColor: Colors.black,
              )),
        ]),
      ],
    );
  }
}
