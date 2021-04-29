import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'src/pages/login_page.dart';
import 'src/pages/splash_page.dart';
import 'src/pages/main_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   final storage = FlutterSecureStorage();
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: userExist(context),
        builder: (context, AsyncSnapshot snap) {
          if( !snap.hasData) return SplashPage();
          if( snap.hasData && snap.data) {
            return MainPage();
          } else {
            return LoginPage();
          }
        }
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.greenAccent[700],
        accentColor: Colors.green[900]
      )
      
    );
  }

  Future<bool> userExist(context) async {
    String _token = await storage.read(key: 'token');
    if (_token != null ) {
      // user already signed    
      return true;
    } else {
      // user never signed;
      return false;
    }
  }
}