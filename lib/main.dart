import 'package:flutter/material.dart';
import 'package:fluttersih/Form.dart';
import 'package:fluttersih/liast_page.dart';
import 'package:fluttersih/tabbed_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title:  "Student Problem",
        theme: new ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          accentColor: Colors.white,
        ),
        home: TabbedBar(),
    );
  }
}




//import 'package:flutter/material.dart';
//
//import 'addproduct.dart';
//import 'homepage.dart';
//
//void main(){
//  runApp(CrudFirestore());
//}
//
//class CrudFirestore extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      initialRoute: HomePage.routeName,
//      routes: {
//        HomePage.routeName:(ctx) =>HomePage(),
//        AddUser.routeName:(ctx) =>AddUser(),
//      },
//    );
//  }
//}
