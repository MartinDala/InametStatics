import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Statics extends StatefulWidget {
  Statics({this.provincia});
  final String provincia;

  @override
  _StaticsState createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  Future<Map<String, dynamic>> getProvice() async {
    final response = await http.get(
        "https://angoprovsapi.herokuapp.com/api/v1/previsao/${widget.provincia}");

    print(json.decode(response.body)['previsao_de_tempo_actual']['Descrição']);
    Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProvice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("INAMET STATICS- BY MARTIN DALA"),
          centerTitle: true,
          backgroundColor: Color(0xFF444444)),
      backgroundColor: Color(0xFF161414),
      body: Container(
        child: FutureBuilder(
            future: getProvice(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(color: Color(0xFF212121)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/nuvem.png",
                                      width: 150,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 1.0, top: 60),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${snapshot.data['previsao_de_tempo_actual']['Temperatura']}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 98),
                                        ),
                                        Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              Text(
                                                snapshot.data['provincia'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25),
                                              ),
                                            ]),
                                        Text(
                                          snapshot.data[
                                                  'previsao_de_tempo_actual']
                                              ['Descrição'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/nuvens.png",
                                    width: 150,
                                  ),
                                  Text(
                                    "Nuvem",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data['previsao_de_tempo_actual']
                                        ['Cobertura de Nuvens'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/pressao.png",
                                      width: 150,
                                    ),
                                    Text(
                                      "Pressão",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      snapshot.data['previsao_de_tempo_actual']
                                          ['Pressão'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/vento.png",
                                    width: 150,
                                  ),
                                  Text(
                                    "Vento",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data['previsao_de_tempo_actual']
                                        ['Vento'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/humidade.png",
                                    width: 150,
                                  ),
                                  Text(
                                    "Humidade",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data['previsao_de_tempo_actual']
                                        ['Humidade'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/pressao.png",
                                    width: 150,
                                  ),
                                  Text(
                                    "Ultra Violetas",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data['previsao_de_tempo_actual']
                                        ['Ultra Violetas'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/nuvens.png",
                                    width: 150,
                                  ),
                                  Text(
                                    "Temperatura Sentida",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data['previsao_de_tempo_actual']
                                        ['Temperatura Sentida'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
