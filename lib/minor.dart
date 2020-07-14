import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'liast_page.dart';

class MinorScreen extends StatefulWidget {
  @override
  _MinorScreenState createState() => _MinorScreenState();
}

class _MinorScreenState extends State<MinorScreen> {
  String _categories;

  final List<String> categories = ['Mobile', 'Web', 'Mixed', 'Advance', 'Hardware'];

  Widget _buildCategories() {
    return DropdownButtonFormField(
      iconSize: 50.0,
      value: _categories ?? 'Mobile',
      items: categories.map((category){
        return DropdownMenuItem(
          value: category,
          child: Text('$category Type ', style: TextStyle(color: Colors.black,), textAlign: TextAlign.center, ),

        );
      }).toList(),
      onChanged: (String value) => setState(() => _categories = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 3.0),
    child: ListView(
    padding: EdgeInsets.all(15.0),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: <Widget>[
    _buildCategories(),
        ],
      ),
      )
    );
  }
}

//Container(
//margin: EdgeInsets.only(top: 3.0),
//child: ListView(
//padding: EdgeInsets.all(15.0),
//shrinkWrap: true,
//scrollDirection: Axis.vertical,
//children: <Widget>[
//_buildCategories(),
//ListPage()

