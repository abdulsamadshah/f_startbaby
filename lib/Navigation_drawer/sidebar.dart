import 'package:f_startbaby/BottomNavigation/Cart.dart';
import 'package:f_startbaby/Category/allcategory.dart';
import 'package:f_startbaby/Utils/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

import '../Admin/product_upload.dart';
import '../BottomNavigation/myorders.dart';
import '../screen/User_Profile.dart';

class Navigationbar extends StatelessWidget {
  const Navigationbar({Key? key}) : super(key: key);

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    bool showspinner=false;
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Drawer(
        child: Material(
          color: Colors.white24,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: Image.asset(
                      "assets/images/appicons.jpg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  listItem(
                      ontap: () {
                        showspinner=true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCategory()));
                        showspinner=false;
                      },
                      label: "Categories",
                      icon: Icons.category),
                  listItem(
                      ontap: () {
                        showspinner=true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Userprofile()));
                        showspinner=false;
                      },
                      label: "My Profile",
                      icon: Icons.account_circle_rounded),
                  listItem(
                      ontap: () {
                        showspinner=true;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Myorder()));
                        showspinner=false;
                      },
                      label: "Order History",
                      icon: Icons.article),
                  listItem(
                    ontap: () {
                      showspinner=true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                      showspinner=false;
                    },
                    label: "Cart",
                    icon: Icons.shopping_cart_outlined,
                  ),
                  // listItem(
                  //   ontap: () {
                  //     print("clicked");
                  //   },
                  //   label: "Favourite",
                  //   icon: Icons.heart_broken,
                  // ),
                  listItem(
                    ontap: () {
                      showspinner=true;
                      var auth = FirebaseAuth.instance;
                      auth.signOut();
                      Fluttertoasts().mytoast("Logout Successfully");
                      showspinner=false;
                    },
                    label: "Logout",
                    icon: Icons.logout,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text("Communicate"),
                  ),
                  listItem(
                    ontap: () {
                      showspinner=true;
                      _shareContent;
                      print("clicked");
                      showspinner=false;
                    },
                    label: "Share",
                    icon: Icons.share,
                  ),
                  listItem(
                    ontap: () {
                      showspinner=true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Uploadproduct()));
                      showspinner=false;
                    },
                    label: "Admin",
                    icon: Icons.account_circle_rounded,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(
      {required String label,
      required IconData icon,
      required VoidCallback ontap}) {
    final color = Colors.black87;
    final hovercolor = Colors.black87;

    return GestureDetector(
      onTap: ontap,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        hoverColor: hovercolor,
        title: Text(label, style: TextStyle(color: color)),
      ),
    );
  }
}
