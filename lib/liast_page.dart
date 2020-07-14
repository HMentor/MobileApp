import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection("Major").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
            // ignore: missing_return
            itemBuilder: (context, index){
                DocumentSnapshot major = snapshot.data.documents[index];
              return ListTile(
              title: Text(major['Problem Statement'],style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),),
              subtitle: Text(major['Type']),

              );
            },
          );
        }
      ),
    );
  }
}
