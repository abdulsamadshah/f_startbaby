import 'package:f_startbaby/Utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/Cartprovider.dart';
import '../screen/Billpage.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var cartref = FirebaseDatabase.instance.reference();
  var firebaseauth=FirebaseAuth.instance;
  var deleteref = FirebaseDatabase.instance.reference().child("Cart");
  var updateref = FirebaseDatabase.instance.reference().child("Cart");
  var cstate;
  var getuserdata = FirebaseDatabase.instance.reference();
  Map? student;
  bool showspinner=false;

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController cname=TextEditingController();
          final TextEditingController cphonenumber=TextEditingController();
          final TextEditingController cemail=TextEditingController();
          final TextEditingController caddress=TextEditingController();
          final TextEditingController carea=TextEditingController();
          final TextEditingController ccity=TextEditingController();
          bool ischecked = false;

          String dropdownvalue = 'Jammu & Kashmir';
          var items = [
            'Jammu & Kashmir',
            "Himachal Pradesh",
            "Punjab",
            "Chandigarh",
            "Uttrakhand",
            "Haryana",
            "Delhi",
            "Rajashtan",
            "Uttarpradesh",
            "Bihar",
            "Sikkim",
            "Arunchal Pradesh",
            "Nagaland",
            "Manipur",
            "Maharashtra",
            "Assam",
            "West Bengal",
          ];
          final customerref=FirebaseDatabase.instance.reference().child("Customer");

          //Dialog box with customer
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Container(
                    child: Container(
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Name",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: cname,
                                    decoration: InputDecoration(
                                      hintText: "Enter Customer Name",
                                      hintStyle: TextStyle(
                                          fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Number",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: cphonenumber,
                                    decoration: InputDecoration(
                                      hintText: "Enter Phone Number",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Email",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: cemail,
                                    decoration: InputDecoration(
                                      hintText: "Enter Customer Email",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: caddress,
                                    decoration: InputDecoration(
                                      hintText: "Enter Address",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Near Area",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: carea,
                                    decoration: InputDecoration(
                                      hintText: "Enter Area",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "City",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    controller: ccity,
                                    decoration: InputDecoration(
                                      hintText: "Enter City",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.only(top: 3, left: 7, right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0, top: 10),
                                  child: Container(
                                    // Container(
                                    width: 320,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey, //
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            5.0), //                 <--- border radius here
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Container(
                                            width: 60,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                // hintText: "Select Category",
                                                // labelText: "${dropdownvalue}",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: SingleChildScrollView(
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(cstate = items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  //var dropdownvalue any object set now
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 320,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  showspinner=true;
                                  firebaseauth.createUserWithEmailAndPassword(email: cemail.text, password: cphonenumber.text).then((value){
                                    // int customerid=DateTime.now().microsecondsSinceEpoch;
                                    customerref.child(firebaseauth.currentUser!.uid).set({
                                      'C_Name':cname.text.toString(),
                                      'C_Number':cphonenumber.text.toString(),
                                      'C_Email':cemail.text.toString(),
                                      'C_Address':caddress.text.toString(),
                                      'C_Area':carea.text.toString(),
                                      'C_City':ccity.text.toString(),
                                      'C_State':dropdownvalue.toString(),


                                    }).then((value) async {
                                      SharedPreferences userdata=await SharedPreferences.getInstance();
                                      userdata.setString('Name', cname.text.toString());
                                      userdata.setString('C_Address', caddress.text.toString());
                                      userdata.setInt('cphoneno', int.parse(cphonenumber.text.toString()));
                                      userdata.setString('cemail', cemail.text.toString());

                                      Navigator.of(context).pop();
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Billpages(
                                        cname.text.toString(),
                                        caddress.text.toString(),
                                        cphonenumber.text.toString(),
                                        cemail.text.toString(),


                                      ),));
                                      showspinner=false;
                                    }).onError((error, stackTrace){
                                      Fluttertoasts().mytoast(error.toString());
                                      showspinner=false;
                                    });
                                  }).onError((error, stackTrace){
                                    Fluttertoasts().mytoast(error.toString());
                                    showspinner=false;
                                  });



                                },
                                child: Text("Save"),style:ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 18),),),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart Item"),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: FirebaseAnimatedList(
                        query: cartref.ref.child("Cart"),
                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                            Animation<double> animation, int index) {
                          // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                          Map student = snapshot.value as Map;
                          student['key'] = snapshot.key;

                          return Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                            student['productimage'])),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showspinner=true;
                                                  });
                                                  deleteref
                                                      .child(student['key'])
                                                      .remove();
                                                  setState(() {
                                                    showspinner=false;
                                                  });
                                                  // Fluttertoasts()
                                                  //     .mytoast("Item Deleted");
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 220, top: 8),
                                                  child: Icon(
                                                    Icons.delete,
                                                  ),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0, right: 30, bottom: 10),
                                              child: Text(
                                                student['productname'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 0, right: 30, bottom: 20),
                                                  child: Text(
                                                    " " +
                                                        r"₹" +
                                                        student['productprice'],
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      showspinner=true;
                                                    });
                                                    print("Clicked");
                                                    int quantity = int.parse(
                                                        student['quantity']);
                                                    print("quantitys:${quantity}");
                                                    int price = int.parse(
                                                        student['initialprize']);
                                                    print("quantitys:${price}");
                                                    quantity--;
                                                    int newprice = price * quantity;
                                                    print(
                                                        "newpricesdata:${newprice}");

                                                    if (quantity >= 0) {
                                                      //update data to firebase database
                                                      Map<String, String> cartitems =
                                                      {
                                                        "productid":
                                                        student['productid'],
                                                        "productname":
                                                        student['productname'],
                                                        "productimage":
                                                        student['productimage'],
                                                        "productdescription": student[
                                                        'productdescription'],
                                                        "productprice":
                                                        newprice.toString(),
                                                        "initialprize":
                                                        student['productprice'],
                                                        "quantity":
                                                        quantity.toString(),
                                                      };
                                                      updateref
                                                          .child(student['key'])
                                                          .update(cartitems)
                                                          .then((value) {
                                                        newprice = 0;
                                                        quantity = 0;
                                                        cart.removetotalprice(
                                                            double.parse(student[
                                                            'productprice']));
                                                        setState(() {
                                                          showspinner=false;
                                                        });
                                                        // Fluttertoasts().mytoast("Updated Successfully");
                                                      }).onError((error, stackTrace) {
                                                        Fluttertoasts().mytoast(
                                                            error.toString());
                                                        setState(() {
                                                          showspinner=false;
                                                        });
                                                      });
                                                    } else {}
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius: BorderRadius.circular(3.0),

                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  student['quantity'],
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 19,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      showspinner=true;
                                                    });
                                                    print("Clicked");
                                                    int quantity = int.parse(
                                                        student['quantity']);
                                                    print("quantitys:${quantity}");
                                                    int price = int.parse(
                                                        student['initialprize']);
                                                    print("quantitys:${price}");
                                                    quantity++;
                                                    int newprice = price * quantity;
                                                    print(
                                                        "newpricesdata:${newprice}");

                                                    //update data to firebase database
                                                    Map<String, String> cartitems = {
                                                      "productid":
                                                      student['productid'],
                                                      "productname":
                                                      student['productname'],
                                                      "productimage":
                                                      student['productimage'],
                                                      "productdescription": student[
                                                      'productdescription'],
                                                      "productprice":
                                                      newprice.toString(),
                                                      "initialprize":
                                                      student['productprice'],
                                                      "quantity": quantity.toString(),
                                                    };
                                                    updateref
                                                        .child(student['key'])
                                                        .update(cartitems)
                                                        .then((value) {
                                                      newprice = 0;
                                                      quantity = 0;
                                                      cart.addtotalprice(double.parse(
                                                          student['productprice']));

                                                      setState(() {
                                                        showspinner=false;
                                                      });
                                                      // Fluttertoasts().mytoast(
                                                      //     "Updated Successfully");
                                                    }).onError((error, stackTrace) {
                                                      Fluttertoasts()
                                                          .mytoast(error.toString());
                                                      setState(() {
                                                        showspinner=false;
                                                      });
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius: BorderRadius.circular(3.0),
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
                Consumer<Cartprovider>(builder: (context, value, child) {
                  // return Visibility(
                  //   //visibility gone karne ka code
                  //   visible: value.gettotalprice().toStringAsFixed(2) == "0.00"
                  //       ? false
                  //       : true,
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  //     child: Column(
                  //       children: [
                  //         Reusablewidget(
                  //             title: "Sub Total:",
                  //             value: r"$" +
                  //                 value.gettotalprice().toStringAsFixed(2)),
                  //         Reusablewidget(title: "Discount:", value: r"$" + "100"),
                  //         Reusablewidget(
                  //             title: "Total:",
                  //             value: r"$" +
                  //                 value.gettotalprice().toStringAsFixed(2)),
                  //       ],
                  //     ),
                  //   ),
                  // );
                  return Visibility(
                    visible: value.gettotalprice().toStringAsFixed(2) == "0.00"
                          ? false
                          : true,
                    child: Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Card(
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, bottom: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        value.gettotalprice().toStringAsFixed(2),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 110,
                                        child: ElevatedButton(
                                            onPressed: () async {

                                              final User? user=firebaseauth.currentUser;
                                              if(user!=null){
                                                setState(() {
                                                  showspinner=true;
                                                });
                                                SharedPreferences preferences = await SharedPreferences.getInstance();
                                                String? name = preferences.getString("Name",)?? "";
                                                String? address = preferences.getString("C_Address",)?? "";
                                                int? cphoneno = preferences.getInt("cphoneno",)?? 0;
                                                String? cemail = preferences.getString("cemail",)?? "";
                                                print("names${name}");
                                                print("address${address}");
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => Billpages(
                                                  name,
                                                  address,
                                                  cphoneno,
                                                  cemail,

                                                )));
                                                setState(() {
                                                  showspinner=false;
                                                });

                                              }else if(user==null){
                                                setState(() {
                                                  showspinner=true;
                                                });
                                                await showInformationDialog(context);
                                                setState(() {
                                                  showspinner=false;
                                                });
                                                // Fluttertoasts().mytoast("user is empty");

                                              }else{
                                                // Fluttertoasts().mytoast("something wrong");

                                              }
                                            },

                                            child: Text("CHECKOUT")),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
              ],
            )
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
