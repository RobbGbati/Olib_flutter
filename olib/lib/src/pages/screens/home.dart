import 'package:flutter/material.dart';
import 'package:olib/src/widgets/post_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> posts = [
    {'title': 'rrrrr', 'value': 'yttyyyy', 'image': 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg'},
    {'title': 'rrrrr', 'value': 'yttyyyy', 'image': 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg'},
    {'title': 'rrrrr', 'value': 'yttyyyy', 'image': 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg'},
    {'title': 'rrrrr', 'value': 'yttyyyy', 'image': 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg'},
  ];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: (this.posts.length + 1),
              itemBuilder: (context, position) => 
                position == 0 ? Container() : PostWidget(post: this.posts[position - 1],),
            ),
          )
        ],
      ),
    );
  }
}