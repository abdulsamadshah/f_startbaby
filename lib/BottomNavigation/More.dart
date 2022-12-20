import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../screen/Aboutus.dart';
import '../screen/Contactus.dart';
import '../screen/Privacypolicy.dart';
class More extends StatefulWidget {
   const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {

  bool showspinner=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("More"),
          backgroundColor: Colors.deepPurple,
        ),

        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                  child: Image.network("https://media.istockphoto.com/id/1304227078/vector/mobile-phone-e-commerce-app-shopping-icon.jpg?s=1024x1024&w=is&k=20&c=5HaTPPa2uBE_IJVpE7d5wH5qEofrhHS9JowmbdPqyWs=")),

              InkWell(
                onTap: (){
                  setState(() {
                    showspinner=true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Aboutus()));
                  setState(() {
                    showspinner=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      // color: Color(0XFF1A1A1C),
                      borderRadius: BorderRadius.circular(2.0),
                      // borderRadius: BorderRadius.only(
                      //     topRight: Radius.circular(5.0),
                      //     bottomRight: Radius.circular(5.0)),
                      //use two colors then use this
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple
                          ]
                      ),
                    ),


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.business_outlined,size: 45,color: Colors.white,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: Text("Company",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Visibility(
                visible: false,
                  child: Text("Company information")),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showspinner=true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ContactUs()));
                  setState(() {
                    showspinner=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      // color: Color(0XFF1A1A1C),
                      borderRadius: BorderRadius.circular(2.0),
                      // borderRadius: BorderRadius.only(
                      //     topRight: Radius.circular(5.0),
                      //     bottomRight: Radius.circular(5.0)),
                      //use two colors then use this
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple
                          ]
                      ),
                    ),


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.headset_mic_rounded,size: 45,color: Colors.white,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: Text("Need Help?",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showspinner=true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacypolicy()));
                  setState(() {
                    showspinner=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      // color: Color(0XFF1A1A1C),
                      borderRadius: BorderRadius.circular(2.0),
                      // borderRadius: BorderRadius.only(
                      //     topRight: Radius.circular(5.0),
                      //     bottomRight: Radius.circular(5.0)),
                      //use two colors then use this
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple
                          ]
                      ),
                    ),


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.article_outlined,size: 45,color: Colors.white,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: Text("Policy Info",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
