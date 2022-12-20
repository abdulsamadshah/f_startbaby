import 'package:flutter/material.dart';
class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(child: Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black),)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("This is the front page of the Simple English Wikipedia. Wikipedias are places where people work together to write encyclopedias in different languages. We use Simple English words and grammar here. The Simple English Wikipedia is for everyone! \nThat includes children and adults who are learning English. There are 224,347 articles on the Simple English Wikipedia. All of the pages are free to use. They have all been published under both the Creative Commons Attribution/Share-Alike License 3.0 and the GNU Free Documentation License. You can help here! You may change these pages and make new pages. Read the help pages and other good pages to learn how to write pages here.\n"
                    " \nIf you need help, you may ask questions at Simple talk.\n\n News is when people talk about current events (things that are happening right now). News Media is a portrayal of current affairs, perspectives and social influence. The news can be given in newspapers, television, magazines, or radio. There are several news channels on cable television that give news all day long, such as Fox News and CNN. There are several news magazines, such as Time, The Economist, and Newsweek. A newsman is a person who helps out with the news. For example, Brian Gotter is a newsman. News Media can be viewed in many forms, such as newspaper, television, and radio.\n\nThis is the front page of the Simple English Wikipedia. Wikipedias are places where people work together to write encyclopedias in different languages. We use Simple English words and grammar here. The Simple English Wikipedia is for everyone! That includes children and adults who are learning English. There are 224,347 articles on the Simple English Wikipedia. All of the pages are free to use. They have all been published under both the Creative Commons Attribution/Share-Alike License 3.0 and the GNU Free Documentation License. You can help here! You may change these pages and make new pages. Read the help pages and other good pages to learn how to write pages here.",style: TextStyle(fontSize: 15),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
