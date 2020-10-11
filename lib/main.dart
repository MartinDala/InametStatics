import 'package:flutter/material.dart';
import 'package:inametstatics/ui/homepage.dart';

void main() {
  runApp(Inamet());
}

class Inamet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inamet Statics",
      home: HomePage(),
    );
  }
}
