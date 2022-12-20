import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  // var readcustomerdataref = FirebaseDatabase.instance;
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController States = TextEditingController();
  final auth = FirebaseAuth.instance;
  var getuserdata = FirebaseDatabase.instance.reference();

  // var users =getuserdata.child("Customer").child(auth.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  query: getuserdata.ref.child("Customer"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                    Map student = snapshot.value as Map;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email Address"),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    controller: email,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: "${student['C_Email']}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User Name"),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    enabled: false,
                                    controller: username,
                                    decoration: InputDecoration(
                                      labelText: "${student['C_Name']}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile Number"),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    controller: mobilenumber,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: "${student['C_Number']}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address"),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    controller: Address,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: "${student['C_Address']}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("State"),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    controller: States,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: "${student['C_State']}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
