import 'package:flutter/material.dart';
import 'package:olib/src/pages/login_page.dart';
import 'package:olib/src/pages/splash_page.dart';
import 'package:olib/src/tools/transition.dart';

import '../resources/utils.dart';
import '../tools/theme.dart';

myAppBar(BuildContext ctx) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: body(ctx),
  );
}

deconnexion(BuildContext ctx) async {
  await Utils.storage.deleteAll();
  Navigator.of(ctx).push(
    Transition(
      nextPage: LoginPage(),
      type: TransitionType.bottomToUp
    )
  );
}

Widget body(BuildContext ctx) {
  return AppBar(
    brightness: Brightness.dark,
    automaticallyImplyLeading: false,
    backgroundColor: ThemeColor.green700,
    title: Text('OLIB', style: TextStyle(fontFamily: 'unicorn', color: ThemeColor.white, fontSize: 32),),
    actions: [
      PopupMenuButton(
        icon: Icon(Icons.more_vert, color: ThemeColor.white),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: Row(
                children: <Widget>[
                  Icon(Icons.info),
                  Text('Info')
                ]),
              value: 0),
            PopupMenuItem(
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  Text('Déconnexion')
                ]),
              value: 1),
          ];
        },
        onSelected: (value) {
          switch(value) {
            case 0: 
              Navigator.of(ctx).push(Transition(nextPage: SplashPage(), type: TransitionType.bottomToUp));
              break;
            default:
              deconnexion(ctx);
              break;
          }
        },
      )
    ],
  );
}
