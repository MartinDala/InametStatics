import 'package:flutter/material.dart';

errorWidget(context, Function f) {
  return Container(
    height: MediaQuery.of(context).size.shortestSide,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Não foi possível acessar o servidor",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          RaisedButton(
            onPressed: f,
            color: Colors.green,
            child: Text(
              'Recarregar',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
        ],
      ),
    ),
  );
}
