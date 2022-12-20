import 'package:badges/badges.dart';
import 'package:f_startbaby/Utils/toasts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../BottomNavigation/Cart.dart';
import '../provider/Cartprovider.dart';

class Feedingnursing extends StatefulWidget {
  const Feedingnursing({Key? key}) : super(key: key);

  @override
  State<Feedingnursing> createState() => _Feedingnursing();
}

class _Feedingnursing extends State<Feedingnursing> {
  var babygearref = FirebaseDatabase.instance.reference().child("starbabies");
  var mycart = FirebaseDatabase.instance.reference().child("Cart");
  bool showspinner=false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Feedingnursing"),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  showspinner=true;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cart()));
                setState(() {
                  showspinner=false;
                });
              },
              child: Center(
                child: Badge(
                  badgeContent: Consumer<Cartprovider>(
                    builder: (context, value, child) {
                      return Text(
                        value.getcounter().toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_cart_sharp),
                ),
              ),
            ),
            SizedBox(
              width: 20.5,
            )
          ],
        ),
        body:
        Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: FirebaseAnimatedList(
                    query: babygearref.ref.child("Feedingnursing"),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                      Map student = snapshot.value as Map;
                      student['key'] = snapshot.key;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                      height: 100,
                                      width: 100,
                                      image:
                                      NetworkImage(student['productimage'])),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 25),
                                          child: Text(
                                            student['productname'],
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          " " + r"₹" + student['productprice'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {

                                              setState(() {
                                                showspinner=true;
                                              });
                                              print("babygearproductid:${student['productid']}");
                                              int cartid = DateTime
                                                  .now()
                                                  .microsecondsSinceEpoch;
                                              mycart.child(cartid.toString()).set(
                                                  {
                                                    "productid": student['productid'],
                                                    "productname": student['productname'],
                                                    "productimage": student['productimage'],
                                                    "productdescription": student['productdescription'],
                                                    "productprice": student['productprice'],
                                                    "previousproductprice": student['productprice'],
                                                    "initialprize": student['productprice'],
                                                    "quantity": student['quantity'],
                                                  }).then((value) {
                                                cart.addtotalprice(double.parse(
                                                    student['productprice']));
                                                cart.addcounters();
                                                Fluttertoasts().mytoast(
                                                    "Add to Cart");
                                                setState(() {
                                                  showspinner=false;
                                                });
                                              }).onError((error, stackTrace) {
                                                Fluttertoasts().mytoast(
                                                    error.toString());
                                                setState(() {
                                                  showspinner=false;
                                                });
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10, right: 10),
                                              child: Container(
                                                height: 35,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepPurple,
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                child: Center(
                                                  child: Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
