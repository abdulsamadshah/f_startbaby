import 'package:f_startbaby/Utils/toasts.dart';
import 'package:f_startbaby/screen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../provider/Cartprovider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class Billpage extends StatelessWidget {
  const Billpage({Key? key}) : super(key: key);


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

class Billpages extends StatefulWidget {
  // final Data task;
  var customername, customeraddress, productid,contactno,emailaddress;

  Billpages(this.customername, this.customeraddress,this.contactno,this.emailaddress);

  @override
  State<Billpages> createState() => _Billpages();
}

class _Billpages extends State<Billpages> {
  var cartitemsref = FirebaseDatabase.instance.reference();
  var orderdataref = FirebaseDatabase.instance.reference().child("Orderdata");
   Map? student;



  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }

  bool showspinnner = false;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }



  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<Cartprovider>(context);
    return ModalProgressHUD(
      inAsyncCall: showspinnner,
      child: Scaffold(
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
                          "Order Number:${value.getordernumber().toString()}",
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
                    height: 345,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: FirebaseAnimatedList(
                                    query: cartitemsref.ref.child("Cart"),
                                    itemBuilder: (BuildContext context,
                                        DataSnapshot snapshot,
                                        Animation<double> animation,
                                        int index) {
                                      int indexdata = int.parse(index.toString());
                                      // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                                      student = snapshot.value as Map;
                                      student?['key'] = snapshot.key;
                                      var producidst=student?['productid'];
                                      print("productidbilltpad${producidst}");
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
                                                student?['productname'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppinsmedium'),
                                              ),
                                            ),

                                            SizedBox(
                                              width: 40,
                                              child: Text(
                                                student?['quantity'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppinsmedium'),
                                              ),
                                            ),

                                            SizedBox(
                                              width: 60,
                                              child: Text(
                                                student?['initialprize'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppinsmedium'),
                                              ),
                                            ),

                                            // Text(student['previousproductprice'], style: TextStyle(fontSize: 16, fontFamily: 'Poppinsmedium', fontWeight: FontWeight.bold),),
                                            Text(
                                              student?['productprice'],
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
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 55,
                  width: 370,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showspinnner=true;
                        });
                        print("billpageproductid:${student?['productid']}");
                        var cartid = student?['productid'];
                        DateTime deliverytime =
                            DateTime.now(); // 30/09/2021 15:54:30
                        int orderid = DateTime.now().microsecondsSinceEpoch;
                          orderdataref.child(orderid.toString()).set({
                            "productid": cartid,
                            'order_number': cart.getordernumber(),
                            'customer_name': widget.customername,
                            'customer_address': widget.customeraddress,
                            'Sub_total': cart.gettotalprice(),
                            'total_amount': cart.gettotalprice(),
                            'product_name': student?['productname'],
                            'qty': student?['quantity'],
                            'Rate': student?['initialprize'],
                            'Total': student?['productprice'],
                            'status': 'OPEN',
                            'Deliverytime': deliverytime.toString(),
                          }).then((value) {

                            cart.setordernumber();
                            cart.deletercartitem();
                            cart.removecounters();
                            cart.removetotalprice(cart.gettotalprice());
                            Fluttertoasts().mytoast("Order Created Successfully");
                              var options = {
                                'key': 'rzp_test_wyVzBF9Z42fdjT',
                                'amount': student?['productprice'],
                                'name': widget.customername,
                                'description': 'Payment',
                                'prefill': {'contact': widget.contactno, 'email': widget.emailaddress},
                                'external': {
                                  'wallets': ['paytm']
                                }
                              };

                              try {
                                _razorpay?.open(options);
                              } catch (e) {
                                setState(() {
                                  showspinnner=false;
                                });
                                debugPrint(e.toString());
                              }

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Dashboard()));
                          }).onError((error, stackTrace) {
                            Fluttertoasts().mytoast(error.toString());
                            setState(() {
                              showspinnner=false;
                            });
                          });
                      },
                      child: Text("CONTINUE")),
                ),
              )
            ],
          ),
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

