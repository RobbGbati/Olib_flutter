import 'package:flutter/material.dart';
import 'package:olib/src/tools/theme.dart';

class PostWidget extends StatefulWidget {
  final Map post;
  PostWidget({this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 6,
            height: 190,
            color: ThemeColor.green700,
          ),
          Container(
            height: 150,
            width: 150,
            color: ThemeColor.white,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(50, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ThemeColor.orange,
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                Transform.translate(
                  offset: Offset(10, 20),
                  child: Card(
                    elevation: 20,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          width: 5,
                          color: ThemeColor.white,
                          style: BorderStyle.solid
                        ),
                        //image: DecorationImage(
                          //image: NetworkImage(widget.post['image'])
                        //)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.post['title'],
                    style: TextStyle(
                      color: ThemeColor.titleTextColor,
                      fontSize: 24,
                      fontFamily: 'unicorn',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      widget.post['value'],
                      style: TextStyle(
                        color: ThemeColor.subTitleTextColor,
                        fontSize: 12,
                        fontWeight:  FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}