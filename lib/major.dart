import 'package:flutter/material.dart';

class MajorScreen extends StatefulWidget {
  @override
  _MajorScreenState createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  String _categories;

  final List<String> categories = ['Mobile', 'Web', 'Mixed', 'Advance', 'Hardware'];

  Widget _buildCategories() {
    return DropdownButtonFormField(
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
      ),

    );
  }
}

