import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String _problemStatement, String _email,
    String _description, String _phoneNumber, String _categories) async {
  await Firestore.instance.collection("Problem statements").add({
    'Problem Statement': _problemStatement,
    'email': _email,
    'Description': _description,
    'Phone Number': _phoneNumber,
    'Category' : _categories,
  });
}



