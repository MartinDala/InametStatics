import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inametstatics/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF161414),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'images/nuvem.png',
              ),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 30),
            Text(
              'Saiba a previsão a um clique 😉',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'INAMET',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
