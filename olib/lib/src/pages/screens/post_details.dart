import 'package:flutter/material.dart';
import 'package:olib/src/resources/constants.dart';
import 'package:olib/src/tools/theme.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key key}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.green700,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: toolbarHeight,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ThemeColor.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Post X \n",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        TextSpan(
                          text: "Date 01/12/2020",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 28),
                        )
                      ])),
                      InkWell(
                          onTap: () {
                            print('go to publisher details');
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 200.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      ),
                      color: ThemeColor.white
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text("Details du posts",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            )),
                        ),
                        Image.network("https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
                         fit: BoxFit.cover),
                         SizedBox(height: 7,),
                         Divider(),
                         Text("Titre du livre"),
                         
                      ],

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
