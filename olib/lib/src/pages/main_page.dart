import 'package:flutter/material.dart';
import 'package:olib/src/tools/theme.dart';
import './screens/home.dart';
import './screens/account.dart';
import './screens/add_post.dart';
import '../widgets/app_bar.dart';
import '../widgets/flipnavbar/flip_box_bar.dart';
import '../widgets/flipnavbar/flip_bar_item.dart';

class MainPage extends StatefulWidget {
  int currentPage;
  MainPage({Key key, this.currentPage}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  var pages = [
    Home(),
    AddPost(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: ThemeColor.lightGrey,
      body: pages[widget.currentPage],
      bottomNavigationBar: FlipBoxBar(
        selectedIndex: widget.currentPage,
        items: [
          FlipBarItem(
            icon: Icon(Icons.home, color: ThemeColor.white, size: 35,),
            frontColor: ThemeColor.green700,
            backColor: ThemeColor.deepOrange
          ),
          FlipBarItem(
            icon: Icon(Icons.add_box, color: ThemeColor.white, size: 35,),
            frontColor: ThemeColor.green700,
            backColor: ThemeColor.deepOrange
          ),
          FlipBarItem(
            icon: Icon(Icons.person, color: ThemeColor.white, size: 35,),
            frontColor: ThemeColor.green700,
            backColor: ThemeColor.deepOrange
          )
        ],
        onIndexChanged: (value) {
          setState(() {
            widget.currentPage = value;
          });
        },
      ),
    );
  }
}