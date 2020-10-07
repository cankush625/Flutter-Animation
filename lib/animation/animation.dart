import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Anim extends StatefulWidget {
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim>
    with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  AnimationController padController;
  Animation<double> padAnimation;

  int i = 0;
  int j = 0;
  double padding = 0;
  bool flag = false;
  bool flag1 = false;

  void changeColors() {
    if  (flag == false && i <= _colors.length-1) {
      sleep(Duration(milliseconds: 100));
      if (i == _colors.length-1) {
        flag = true;
      } else {
        print(i);
        i++;
      }
    } else if (flag == true && i >= 0) {
      sleep(Duration(milliseconds: 100));
      if (i == 0) {
        flag = false;
      } else {
        print(i);
        i--;
      }
    }
  }

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
      setState(() {
        changeColors();
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animController.forward();
      }
    });
    animController.forward();

    // Second Animation Controller
    padController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    padAnimation = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(padController)
    ..addListener(() {
      setState(() {
        padding = padAnimation.value;
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        padController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        padController.forward();
      }
    });
    padController.forward();
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
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(padding * 200, padding * 100),
                  child: Image(
                    image: AssetImage(
                      'assets/Flutter.png',
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                Transform.scale(
                  scale: padding * 4,
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(padding * -200, padding * 100),
                  child: Image(
                    image: AssetImage(
                      'assets/Dart.png',
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Transform.rotate(
              angle: animation.value,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: padding * 100),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _colors[i],
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: padding * 2.3,
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
            ),
          ],
        ),
      ),
    );
  }

  final _colors = [
    Color(0xFFc95959),
    Color(0xFFc43f3f),
    Color(0xFFc42727),
    Color(0xFFc91818),
    Color(0xFFc40808),
    Color(0xFFc47e49),
    Color(0xFFc77334),
    Color(0xFFc76720),
    Color(0xFFc25b10),
    Color(0xFFc25608),
    Color(0xFFbdb85b),
    Color(0xFFc4be49),
    Color(0xFFc4bd33),
    Color(0xFFc9c11e),
    Color(0xFFc9c008),
    Color(0xFF4dc45b),
    Color(0xFF3ec94f),
    Color(0xFF2bcc3f),
    Color(0xFF16c42b),
    Color(0xFF07b31c),
    Color(0xFF4446b8),
    Color(0xFF3032ab),
    Color(0xFF21239c),
    Color(0xFF12148a),
    Color(0xFF050778),
    Color(0xFF5bbaba),
    Color(0xFF42b8b8),
    Color(0xFF2bbaba),
    Color(0xFF038ea3),
    Color(0xFF017a8c),
    Color(0xFF874dab),
    Color(0xFF7b3ba3),
    Color(0xFF6c2599),
    Color(0xFF5b1487),
    Color(0xFF4d0778),
  ];

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}