import 'dart:math';

import 'package:flutter/material.dart';

class CylindricalAnimation extends StatefulWidget {
  @override
  _CylindricalAnimationState createState() => _CylindricalAnimationState();
}

class _CylindricalAnimationState extends State<CylindricalAnimation> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  int numberOfVal = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b1c1e),
      body: Center(
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...List.generate(numberOfVal, (index){
                return AnimatedBuilder(
                    animation: _controller!,
                    builder: (context, snapshot) {
                      final animationValue = _controller!.value * (2 * pi / numberOfVal);
                      var rotation = (2 * pi * index/numberOfVal) + animationValue;

                      return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(rotation)
                            ..translate(-120.0),
                          child: VerticalText()
                      );
                    }
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 4))..repeat();
  }
}

class VerticalText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 3,
        child: Text("FLUTTER",
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),)
    );
  }
}
