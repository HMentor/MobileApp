import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Form.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post:post,)));
  }

  Future getPosts()async{
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("Mobile Based Hard").getDocuments();
    return qn.documents;
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile Hard"),),
      // ignore: missing_return
      body: FutureBuilder(
        future: getPosts(),
        // ignore: missing_return
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child:Text("Loading...Please Wait"),
              );
        }else{
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){

                return ListTile(
                  title: Text(snapshot.data[index]["Owner"], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),),
                  subtitle:Text(snapshot.data[index]["Problem Statement"]),
                  trailing: RaisedButton.icon(onPressed: () => navigateToDetail(snapshot.data[index]),
                      icon: Icon(Icons.arrow_right), label: Text("SeeMore")),

                );

          });
          }
        }),
    );
  }
}

//

//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class ListPage extends StatefulWidget {
//  @override
//  _ListPageState createState() => _ListPageState();
//}
//
//class _ListPageState extends State<ListPage> {
//
//  navigateToDetail(QuerySnapshot post){
//    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post:post,)));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("Mobile Hard"),),
//      body: StreamBuilder<QuerySnapshot>(
//        stream: Firestore.instance.collection("Mobile Based Hard").snapshots(),
//          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
//          if(querySnapshot.hasError)
//            return Text("Some Error");
//
//          if(querySnapshot.connectionState == ConnectionState.waiting){
//            return CircularProgressIndicator();
//          }else{
//
//            final list = querySnapshot.data.documents;
//            return ListView.builder(
//
//              itemBuilder:(context, index){
//                return ListTile(
//                  title: Text(list[index]["Owner"], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold ),),
//                  subtitle: Text(list[index]["Problem Statement"]),
//                  trailing: Text("See More", textAlign: TextAlign.center, ),
//                  onTap: () => navigateToDetail(querySnapshot.data),
//                );
//              },
//            itemCount: list.length,
//            );
//          }
//          },
//        ),
//    );
//  }
//}


class DetailPage extends StatefulWidget {

  final DocumentSnapshot post;

  DetailPage({this.post});

  @override

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.data['Owner']),),
      body: Container(
        child:Card(
          child: ListView(
            padding: EdgeInsets.all(15.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(widget.post.data["Owner"], style: TextStyle(fontSize: 18.0, color: Colors.black),),
              SizedBox(height: 10.0,),
              Text(widget.post.data["Problem Statement"],style: TextStyle(fontSize: 18.0, color: Colors.black),),
              //SizedBox(height: 10.0,),
              //Text(widget.post.data["Description"], style: TextStyle(fontSize: 18.0, color: Colors.black),),
              SizedBox(height: 10.0,),
              Text(widget.post.data["Required Skill"], style: TextStyle(fontSize: 18.0, color: Colors.black),),
              SizedBox(height: 10.0,),
              //Text(widget.post.data["Youtube Link"], style: TextStyle(fontSize: 18.0, color: Colors.black),),
              SizedBox(height: 20.0,),
              RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  splashColor: Colors.orangeAccent,
                  hoverColor: Colors.orangeAccent,
                  color: Colors.deepOrangeAccent,
                  focusColor: Colors.orangeAccent,
                  child: Text("Ask to Mentor", style: TextStyle(fontSize: 18.0, color: Colors.white, ),),
                  onPressed: () {
                  Navigator.push(
                         context,
                           MaterialPageRoute(builder: (context) => FormScreen()),
                      );
                  }
              ),
            ],
          ),
        ),
        ),
    );
  }
}
