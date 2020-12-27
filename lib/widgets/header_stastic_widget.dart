import 'package:flutter/material.dart';

headerStatisticWidget(context, provincia, previsao) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 250,
    decoration: BoxDecoration(color: Color(0xFF212121)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Center(
            child: Image.network(
              "${previsao.tempoImage}",
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
            top: 60,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "${previsao.temperatura}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 98,
                  ),
                ),
                Text(
                  "$provincia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "${previsao.descrissao}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
