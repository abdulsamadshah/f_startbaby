import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/Billpage.dart';

class Cartprovider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  double _totalprice = 0;

  double get totalprice => _totalprice;

  String _ordernumber = "";

  String get ordernumber => _ordernumber;

  setprefitems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("cartitem", counter);
    preferences.setDouble("totalprice", totalprice);
  }

  getprefitems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt("cartitem") ?? 0;
    _totalprice = preferences.getDouble("totalprice") ?? 0;
  }

  void addcounters() {
    _counter++;
    setprefitems();
    notifyListeners();
  }

  void removecounters() {
    _counter--;
    setprefitems();
    notifyListeners();
  }

  int getcounter() {
    getprefitems();
    return _counter;
  }

  void addtotalprice(double productprice) {
    _totalprice = _totalprice + productprice;
    setprefitems();
    notifyListeners();
  }

  void removetotalprice(double productprice) {
    _totalprice = _totalprice - productprice;
    setprefitems();
    notifyListeners();
  }

  double gettotalprice() {
    getprefitems();
    return _totalprice;
  }

  //setorder to first of all setordertopref then getorder to pref and setordernumber and getgetordernumber
  setorderprefitems() async {
    DateTime data = DateTime.now();

    var curentdatetime = data.hour.toString() +
        data.minute.toString() +
        data.second.toString() +
        data.day.toString() +
        data.month.toString() +
        data.year.toString();
    String currentordernumbers = "STB${curentdatetime}";
    _ordernumber = currentordernumbers.toString();
    print("STB${curentdatetime}");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ordernumber", _ordernumber);
  }

  getprefordernumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _ordernumber = preferences.getString(
          "ordernumber",
        ) ??
        "";
  }

  String setordernumber() {
    setorderprefitems();
    notifyListeners();
    return _ordernumber;
  }

  String getordernumber() {
    getprefordernumber();
    notifyListeners();
    return _ordernumber;
  }

  //red type means here is error provide class inside
  void deletercartitem() {
    var deleletecartitemref = FirebaseDatabase.instance.reference();
    deleletecartitemref.child('Cart').remove();
    notifyListeners();
  }



}
