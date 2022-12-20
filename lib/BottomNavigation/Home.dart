import 'package:flutter/material.dart';

import '../Category/Bathandskincare.dart';
import '../Category/Feedingandnursing.dart';
import '../Category/Nursery.dart';
import '../Category/babygear.dart';
import '../Category/toysandGaming.dart';
import '../Navigation_drawer/sidebar.dart';
import '../Utils/CarouselWithDotsPage.dart';
import '../Category/allcategory.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://previews.123rf.com/images/visible3dscience/visible3dscience1611/visible3dscience161100161/67542756-cute-baby-with-big-sale-sign.jpg',
    'https://www.shutterstock.com/image-vector/baby-goods-sale-banner-special-260nw-1118890226.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjKkwaeLPRwQuJgnx08bex5DBQZZdJB9Ms0Q&usqp=CAU',
  ];

  static var categoryimgList = [
    Image.network(
      'https://cdn.fcglcdn.com/brainbees/images/cattemplate/baby_gear_de_view_all_featured_040321_02.jpg',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://okplay.in/wp-content/uploads/2021/07/toys-suppliers-in-india.png',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdWtEN5C7NvATwPZ-9MiMscY5oepyFpi2fzQ&usqp=CAU',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://cdn.fcglcdn.com/brainbees/images/cattemplate/desktop_bath_&_skincare_freeheight.jpg',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://static.vecteezy.com/system/resources/thumbnails/012/800/424/small_2x/feeding-bottle-icon-with-kawaii-face-isolated-on-white-background-illustration-design-element-for-kids-baby-shower-and-nursery-decor-vector.jpg',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://www.hrmexam.com/wp-content/uploads/2021/06/Workplace-Health-and-Safety.jpg',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://www.hrmexam.com/wp-content/uploads/2021/06/Workplace-Health-and-Safety.jpg',
      height: 130,
      width: 150,
      fit: BoxFit.fill,
    ),
  ];

  final List<String> categoryname = [
    'Baby Gear',
    'Toys & Gaming',
    'Nursery',
    'Feeding & Nursing',
    'Bath & Skin Care'
  ];

  bool showspinner=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Navigationbar(),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: CarouselWithDotsPage(imgList: imgList),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular Category",
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCategory()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                  height: 350,
                  child: GestureDetector(
                    onTap: () {},
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
                          onTap: () {},
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Babygearproduct()));
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Card(
                                    child: categoryimgList[0],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Text(
                                      "Baby Gear",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ToysandGaming()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Card(
                                  child: categoryimgList[1],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "Toys & Gaming",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Nursery()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Card(
                                  child: categoryimgList[2],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "Nursery",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Feedingnursing()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Card(
                                  child: categoryimgList[3],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "Feeding & Nursing",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bathandskincare()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Card(
                                  child: categoryimgList[4],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "Bath & Skin Care",
                                    style: TextStyle(fontSize: 17),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
