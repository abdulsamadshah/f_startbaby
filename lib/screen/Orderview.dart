import 'package:f_startbaby/Utils/toasts.dart';
import 'package:f_startbaby/screen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:provider/provider.dart';

import '../provider/Cartprovider.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class OrderViews extends StatefulWidget {
  var customername, ordernumber, customeraddress;

  OrderViews(this.customername, this.ordernumber, this.customeraddress);

  @override
  State<OrderViews> createState() => _OrderViews();
}

class _OrderViews extends State<OrderViews> {
  // var cartitemsref = FirebaseDatabase.instance.reference();
  var orderdataref = FirebaseDatabase.instance.reference();
   Map? student;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/microlan.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "Address: Hanuman Mandir Ekta Nagar Gass Road Nallasopara West",
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Poppinsmedium'),
                          ),
                        ),
                      ),
                      Text(
                        "GST:  78GSSDR698548",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Poppinsmedium'),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Order No:",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontFamily: 'Poppinsmedium',
                  //       fontWeight: FontWeight.bold),
                  // ),

                  Consumer<Cartprovider>(
                    builder: (context, value, child) {
                      return Text(
                        "Order Number:${widget.ordernumber}",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppinsmedium',
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  Text(
                    "Customer Name: ${widget.customername}",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Customer Adress: ${widget.customeraddress}",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 3,
              color: Colors.black12,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sr.\nNo.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Product",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "QTY",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rate",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppinsmedium',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 3,
              color: Colors.black12,
              thickness: 2,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  //set the heing to size box then
                  // fixed height
                  height: 420,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: FirebaseAnimatedList(
                                  query: orderdataref.ref.child("Orderdata"),
                                  itemBuilder: (BuildContext context,
                                      DataSnapshot snapshot,
                                      Animation<double> animation,
                                      int index) {
                                    int indexdata = int.parse(index.toString());
                                    // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                                    student = snapshot.value as Map;
                                    student?['key'] = snapshot.key;
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Text(
                                              indexdata.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppinsmedium'),
                                            ),
                                          ),

                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              student?['product_name'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppinsmedium'),
                                            ),
                                          ),

                                          SizedBox(
                                            width: 40,
                                            child: Text(
                                              student?['qty'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppinsmedium'),
                                            ),
                                          ),

                                          SizedBox(
                                            width: 60,
                                            child: Text(
                                              student?['Rate'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppinsmedium'),
                                            ),
                                          ),

                                          // Text(student['previousproductprice'], style: TextStyle(fontSize: 16, fontFamily: 'Poppinsmedium', fontWeight: FontWeight.bold),),
                                          Text(
                                            student?['Total'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppinsmedium'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 3,
              color: Colors.black12,
              thickness: 2,
            ),
            Consumer<Cartprovider>(builder: (context, value, child) {
              return Visibility(
                //visibility gone karne ka code
                // visible: value.gettotalprice().toStringAsFixed(2) == "0.00"
                //     ? false
                //     : true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Reusablewidget(
                            title: "Sub Total:",
                            value: r"₹" +
                                value.gettotalprice().toStringAsFixed(2)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Reusablewidget(
                            title: "Discount:", value: r"₹" + "0"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Reusablewidget(
                            title: "Total Amount:",
                            value: r"₹" +
                                value.gettotalprice().toStringAsFixed(2)),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Reusablewidget extends StatelessWidget {
  final String title, value;

  const Reusablewidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(
          value.toString(),
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ],
    );
  }
}
