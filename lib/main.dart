import 'package:f_startbaby/BottomNavigation/More.dart';
import 'package:f_startbaby/provider/Cartprovider.dart';
import 'package:f_startbaby/screen/Billpage.dart';
import 'package:f_startbaby/screen/Dashboard.dart';
import 'package:f_startbaby/screen/razorpayitegration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


import 'Admin/product_upload.dart';
import 'Category/babygear.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Cartprovider(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Starbaby',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: const Dashboard(),
          );
        },
      ),
    );
  }
}

