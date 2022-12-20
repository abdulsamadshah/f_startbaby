import 'package:f_startbaby/Category/toysandGaming.dart';
import 'package:flutter/material.dart';

import '../Category/Bathandskincare.dart';
import '../Category/Feedingandnursing.dart';
import '../Category/Nursery.dart';
import '../Category/babygear.dart';
import '../Category/toysandGaming.dart';
import '../Navigation_drawer/sidebar.dart';
import '../Utils/CarouselWithDotsPage.dart';
class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {

  static var categoryimgList = [
    Image.network(
      'https://cdn.fcglcdn.com/brainbees/images/cattemplate/baby_gear_de_view_all_featured_040321_02.jpg',height: 130,width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://okplay.in/wp-content/uploads/2021/07/toys-suppliers-in-india.png',height: 130,width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdWtEN5C7NvATwPZ-9MiMscY5oepyFpi2fzQ&usqp=CAU',height: 130,width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://cdn.fcglcdn.com/brainbees/images/cattemplate/desktop_bath_&_skincare_freeheight.jpg',height: 130,width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://static.vecteezy.com/system/resources/thumbnails/012/800/424/small_2x/feeding-bottle-icon-with-kawaii-face-isolated-on-white-background-illustration-design-element-for-kids-baby-shower-and-nursery-decor-vector.jpg',height: 130,width: 150,fit: BoxFit.fill,
    ),

    Image.network(
      'https://www.hrmexam.com/wp-content/uploads/2021/06/Workplace-Health-and-Safety.jpg',height: 130,width: 150,fit: BoxFit.fill,
    ),

    Image.network(
      'https://www.hrmexam.com/wp-content/uploads/2021/06/Workplace-Health-and-Safety.jpg',height: 130,width: 150,fit: BoxFit.fill,
    ),
  ];

  final List<String> categoryname = [
    'Baby Gear',
    'Toys & Gaming',
    'Nursery',
    'Feeding & Nursing',
    'Bath & Skin Care'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Category"),
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
        child: Container(
          height: 350,
          child: GestureDetector(
            onTap: () {

            },
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              //Vertical viewport was given unbounded height. this error then you can use    scrollDirection: Axis.vertical,
              //                 shrinkWrap: true,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Babygearproduct()));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Card(child: categoryimgList[0],),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text("Baby Gear",style: TextStyle(fontSize: 17),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ToysandGaming()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Card(child: categoryimgList[1],),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text("Toys & Gaming",style: TextStyle(fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Nursery()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Card(child: categoryimgList[2],),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text("Nursery",style: TextStyle(fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedingnursing()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Card(child: categoryimgList[3],),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text("Feeding & Nursing",style: TextStyle(fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bathandskincare()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Card(child: categoryimgList[4],),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text("Bath & Skin Care",style: TextStyle(fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
