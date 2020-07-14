import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _problemStatement;
  String _email;
  String _description;
  String _phoneNumber;
  String _categories;


 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> categories = ['Mobile', 'Web', 'Mixed', 'Advance', 'Hardware'];

 Widget _buildProblemStatement() {
   return TextFormField(
     decoration: InputDecoration(labelText: 'Problem Statement', labelStyle: TextStyle(color: Colors.black)),
     // ignore: missing_return
     validator: (String value){
       if(value.isEmpty){
         return 'Name is Rquired';
       }
     },
     onChanged: (String value){
       _problemStatement = value;
     },
   );
 }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.black)
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Email is Rquired';
        }
        if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(value)) {
          return 'Please Enter a Valid email address';
        }
        return null;
      },
      onChanged: (String value){
        _email = value;
      },
    );
  }


  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Description",
          labelStyle: TextStyle(color: Colors.black)
          ),
      style: TextStyle(
        color: Colors.black,
      ),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return "Empty value";
        }
      },
      onChanged: (String value) {
        _description = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(

      decoration: InputDecoration(labelText: 'Phone Number',labelStyle: TextStyle(color: Colors.black)),
      // ignore: missing_return
      keyboardType: TextInputType.number,
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
           return 'Phone is Rquired';
        }
      },
      onChanged: (String value){
        _phoneNumber = value;
      },
    );
  }

  Widget _buildCategories() {
    return DropdownButtonFormField(
      value: _categories ?? 'Mobile',
      items: categories.map((category){
        return DropdownMenuItem(
          value: category,
          child: Text('$category Type ', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),

        );
      }).toList(),
      onChanged: (String value) => setState(() => _categories = value),
    );
  }

  Widget _buildText() {
    return Text('Enter the details to ask the Mentor', style: TextStyle(fontSize: 20.0, color: Colors.deepOrange), );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mentor Form"),centerTitle: false,),
      body : Center(
        child: ListView(
          padding: EdgeInsets.all(24.0),
          shrinkWrap: true,
          children: <Widget>[
            Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(height: 20.0,),
              _buildProblemStatement(),
              _buildDescription(),
              _buildEmail(),
            _buildPhoneNumber(),
            _buildCategories(),
              SizedBox(height: 30.0,),
              SizedBox(
                height: 45.0,
                width: 200.0,
                child:RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                splashColor: Colors.orangeAccent,
                hoverColor: Colors.orangeAccent,
                color: Colors.deepOrangeAccent,
                focusColor: Colors.orangeAccent,
                child: Text("Submit", style: TextStyle(fontSize: 18.0, color: Colors.white, ),),
                onPressed: () {
                  uploadingData(
                      _problemStatement, _email, _description, _phoneNumber, _categories);
                  Navigator.of(context).pop();
                }
              ),
              ),
            ],
          ),),
      ),
      ],
    ),
    ),
    );
  }
}
