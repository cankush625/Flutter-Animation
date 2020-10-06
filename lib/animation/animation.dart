import 'package:flutter/material.dart';
import 'dart:math' as math;

class Anim extends StatefulWidget {
  _AnimState createState() => _AnimState();
}

// Use TickerProviderStateMixin if you have multiple AnimationControllers
class _AnimState extends State<Anim>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animController)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animController.forward();
      }
    });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation',
        ),
      ),
      body: SafeArea(
        child: Transform.rotate(
          angle: animation.value,
          child: Center(
            child: Container(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}