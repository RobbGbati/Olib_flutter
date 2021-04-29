import 'package:flutter/cupertino.dart';

class ClipPainter extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);

    // top left corner
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .25 , height * .35);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    // left middle
    var fifthControlPoint = Offset(width * .4, height * .6);
    var fifthEndpoint = Offset(width * .26, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fifthEndpoint.dx, fifthEndpoint.dy);


    /// Bottom Left corner
    var thirdControlPoint =  Offset(0  ,height);
    var thirdEndPoint = Offset(width , height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);
    
    path.lineTo(0, height);
    path.close();

    return path;
  
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}