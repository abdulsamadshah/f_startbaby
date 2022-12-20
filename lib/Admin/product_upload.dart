import 'package:f_startbaby/screen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import '../Utils/round_btn.dart';
import '../Utils/toasts.dart';

class Uploadproduct extends StatefulWidget {
  const Uploadproduct({Key? key}) : super(key: key);

  @override
  State<Uploadproduct> createState() => _UploadproductState();
}

class _UploadproductState extends State<Uploadproduct> {
  final postref = FirebaseDatabase.instance.reference().child("starbabies");
  TextEditingController product_name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantity = TextEditingController();

  String dropdownvalue = 'BabyGear';
  var items = [
    'BabyGear',
    "ToysGaming",
    "Nursery",
    "Feedingnursing",
    "Bathandskincare",
    "healthandsafety",
    "Gifts",
    "Clothesandshoes",
    "Diapering",
    "SchoolSupplies",
    "Skincare",
    "Momsandmaternity",
  ];

  // List of items in our dropdown menu
  var category;
  File? image;
  var pickimage = ImagePicker();
  File? categoryimage;
  var categorypickimage = ImagePicker();

  void selectimagedailog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImagecamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getImageGallery();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.browse_gallery),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Product"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
              },
              child: Icon(Icons.home_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    //iamges loading offline
                    padding: const EdgeInsets.only(left: 0, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: InkWell(
                        onTap: () {
                          selectimagedailog(context);
                          print("selected");
                        },
                        child: Container(
                          // height: MediaQuery.of(context).size.height * .2,
                          // width: MediaQuery.of(context).size.height * 1,

                          child: Container(
                              height: 90,
                              width: 90,

                              // height: MediaQuery.of(context).size.height * .2,
                              // width: MediaQuery.of(context).size.height * 1,

                              child: CircleAvatar(
                                  child: image != null
                                      ? ClipRect(
                                          child: Image.file(image!.absolute,
                                              fit: BoxFit.fitHeight),
                                        )
                                      : Container(
                                          child: CircleAvatar(
                                            foregroundImage: AssetImage(
                                                "assets/images/appicons.png"),
                                          ),
                                        ))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Container(
                      // Container(
                      width: 320,
                      height: 40,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Select Category",
                                  labelText: "${dropdownvalue}",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Container(
                              child: SingleChildScrollView(
                                child: DropdownButton(
                                  // Initial Value
                                  value: dropdownvalue,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(category = items),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: product_name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Productname ",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Product Description",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: price,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Product Price",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: quantity,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Quantity",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        getcategoryImageGallery();
                      },
                      child: Container(
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Upload Category Image",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                        child: Roundbtn(
                      loading: false,
                      title: "Upload Category",
                      ontap: () async {
                        int productid = DateTime.now().microsecondsSinceEpoch;
                        //i created image upload and she ref url
                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref("starbaby$productid");

                        UploadTask uploadtask = ref.putFile(image!.absolute);
                        await Future.value(uploadtask);
                        //and thend download image url created
                        var productimg = await ref.getDownloadURL();

                        firebase_storage.Reference categoryref =
                            firebase_storage.FirebaseStorage.instance
                                .ref("starbabycategory$productid");
                        UploadTask categoryuploadtask =
                            categoryref.putFile(categoryimage!.absolute);
                        await Future.value(categoryuploadtask);
                        //and thend download image url created
                        var categoryimgurl = await categoryref.getDownloadURL();

                        postref
                            .child(dropdownvalue)
                            .child(productid.toString())
                            .set({
                          "productid": productid.toString(),
                          "categoryname": dropdownvalue.toString(),
                          "categoryimage": categoryimgurl.toString(),
                          "productname": product_name.text.toString(),
                          "productimage": productimg.toString(),
                          "productdescription": description.text.toString(),
                          "productprice": price.text.toString(),
                          "quantity": quantity.text.toString(),
                        }).then((value) {
                          Fluttertoasts().mytoast("Uploaded Successfully");
                        }).onError((error, stackTrace) {
                          print(error.toString());
                          Fluttertoasts().mytoast(error.toString());
                        });
                      },
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImageGallery() async {
    final pickfile = await pickimage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        image = File(pickfile.path);
      } else {
        Fluttertoasts().mytoast("No image selected");
      }
    });
  }

  Future getcategoryImageGallery() async {
    final categorypickfile =
        await categorypickimage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (categorypickfile != null) {
        categoryimage = File(categorypickfile.path);
      } else {
        Fluttertoasts().mytoast("No categoryimage selected");
      }
    });
  }

  Future getImagecamera() async {
    final pickfile = await pickimage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        image = File(pickfile.path);
      } else {
        Fluttertoasts().mytoast("No image selected");
      }
    });
  }
}
