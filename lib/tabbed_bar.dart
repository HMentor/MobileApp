import 'package:flutter/material.dart';
import 'package:fluttersih/Form.dart';
import 'package:fluttersih/web.dart';

import 'App.dart';
import 'major.dart';
import 'minor.dart';


class TabbedBar extends StatefulWidget {
 static const routeName = 'tabbedBar';

  @override
  _TabbedBarState createState() => _TabbedBarState();
}

class _TabbedBarState extends State<TabbedBar> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title:new Text("HMentor", ),
        elevation: 0.7,
        bottom: new TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 18.0),
          controller: _tabController,
        indicatorColor: Colors.white30 ,
            isScrollable: true,
            tabs: <Widget>[
              new Tab(text: 'Minor', ),
              new Tab(text: 'Major ',),
              new Tab(text: 'Innovation',),
              new Tab(text: 'HMentor',),

            ],
      ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new MinorScreen(),
          new MajorScreen(),
          new AppScreen(),
          new WebScreen(),

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
          child: new Icon(Icons.add, color: Colors.white,),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormScreen()),
            );
          }
      ),
    );
  }
}
