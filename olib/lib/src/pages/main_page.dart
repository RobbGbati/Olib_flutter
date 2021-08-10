import 'package:flutter/material.dart';
import 'package:olib/src/tools/theme.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import './screens/home.dart';
import './screens/account.dart';
import './screens/add_post.dart';
import '../widgets/app_bar.dart';

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
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: widget.currentPage, // Use this to update the Bar giving a position
        onTap: (index){
          setState(() {
            widget.currentPage = index;
          });
        },
        items: [
            TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
            TitledNavigationBarItem(title: Text('Add'), icon: Icons.add_box),
            TitledNavigationBarItem(title: Text('Profil'), icon: Icons.person),
        ]
      ),
    );
  }
}

