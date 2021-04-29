import 'package:flutter/material.dart';
import 'package:olib/src/widgets/aureole.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.white, Colors.greenAccent[700]],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror
          )
        ),
        child: Stack(
          children: <Widget> [
            Positioned(
              bottom: 15,
              right: -MediaQuery.of(context).size.width * .46,
              child: Aureole(-3.5, Colors.green[700], Colors.greenAccent[700])
            ),
            Positioned(
              top: 1,
              left: -MediaQuery.of(context).size.width * .32,
              child: Aureole(-1, Colors.deepOrangeAccent, Colors.deepOrange)
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(15,10, 15,10),
                margin: EdgeInsets.all(55),
                child: Text('OLIB',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'unicorn',
                  color: Colors.white,
                  letterSpacing: 15
                ),),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.deepOrange, Colors.orange],
                  tileMode: TileMode.repeated),
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(22))
                ),
              ),
              CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrange),)
            ],
          )
          ]
        )
      ),
    );
  }
}