import 'package:badges/badges.dart';
import 'package:f_startbaby/Navigation_drawer/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../BottomNavigation/Home.dart';
import '../BottomNavigation/Cart.dart';
import '../BottomNavigation/myorders.dart';
import '../BottomNavigation/More.dart';
import 'package:community_material_icon/community_material_icon.dart';

import '../provider/Cartprovider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int PageIndex = 0;
  final page = [Home(), Cart(), Myorder(), More()];
bool showspinner=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(

        // backgroundColor:  Color(Colors.white),
        body: page[PageIndex],
        bottomNavigationBar: buildMyNavbar(BuildContext, context),
      ),
    );
  }

  Container buildMyNavbar(BuildContext, context) {
    return Container(
      color: Color(0XFFF5F5F5),
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showspinner=true;
                    PageIndex = 0;
                    showspinner=false;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 28,
                )),
             InkWell(
               onTap: (){
                 setState(() {
                   showspinner=true;
                   PageIndex=1;
                   showspinner=false;
                 });
               },
               child: Badge(
                badgeContent: Consumer<Cartprovider>(
                  builder: (context, value, child) {
                    return Visibility(
                      visible: value.gettotalprice().toStringAsFixed(2) == "0.00"
                          ? false
                          : true,
                      child: Text(
                        value.getcounter().toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_cart_sharp),
            ),
             ),

            IconButton(
                onPressed: () {
                  setState(() {
                    showspinner=true;
                    PageIndex = 2;
                    showspinner=false;
                  });
                },
                icon: Icon(
                  Icons.wallet_travel_outlined,
                  size: 28,
                )),
            IconButton(
                onPressed: () {
                  showspinner=true;
                  PageIndex = 3;
                  showspinner=false;
                  print("clicked");
                },
                //he is a custome icons
                icon: Icon(
                  size: 28,
                  CommunityMaterialIcons.dots_horizontal_circle))
          ],
        ),
      ),
    );
  }
}
