import 'package:flutter/material.dart';

progressBarWidget(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.shortestSide,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: new CircularProgressIndicator(),
        ),
        SizedBox(height: 30),
        Text(
          'Carregando o tempo, aguarde...',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
  );
}
