import 'package:flutter/material.dart';

import 'animation/animation.dart';

void main() {
  runApp(AnimationApp());
}

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Anim(),
    );
  }
}
