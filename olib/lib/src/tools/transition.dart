import 'package:flutter/material.dart';

class Transition extends PageRouteBuilder {
  final Widget nextPage;
  final int type;
  Transition({@required this.nextPage,@required this.type})
      : super(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (type) {
              case TransitionType.bottomToUp:
                return bottomToUp(animation, child);
              case TransitionType.leftToRight:
                return leftToRight(animation, child);
              default: 
                return fade(animation, nextPage);
            }
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return nextPage;
          },
        );
          
  static bottomToUp(animation, target) {
    Animation<Offset> custom =
        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
            .animate(animation);
    return SlideTransition(
      position: custom,
      child: target,
    );
  }

  static leftToRight(animation, target) {
    Animation<Offset> custom =
        Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
            .animate(animation);
    return SlideTransition(
      position: custom,
      child: target,
    );
  }

  static fade(animation, target) {
    return FadeTransition(
      opacity: animation,
      child: target,
    );
  }
}

class TransitionType {
  static const bottomToUp = 1;
  static const leftToRight = 2;
  static const fade = 3;
}
