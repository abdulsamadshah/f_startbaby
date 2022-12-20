import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black),)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Virat Enterprises",style: TextStyle(fontSize: 15),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Mr John Smith 132, My Street Bigtown BG23 4YZ England",style: TextStyle(fontSize: 15),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Contact No. 7249303582.\nEmai Us on sabdulsamad272@gmail.com",style: TextStyle(fontSize: 15),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

