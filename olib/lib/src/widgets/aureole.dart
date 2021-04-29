import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olib/src/widgets/custom_clipper.dart';

class Aureole extends StatelessWidget {
  final double angle;
  final Color col1;
  final Color col2;
  Aureole(this.angle, this.col1, this.col2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi /  angle,
        child: ClipPath(
          clipper: ClipPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ this.col1, this.col2]
              )
            ),
          ),
        ),
      ),
    );
  }
}