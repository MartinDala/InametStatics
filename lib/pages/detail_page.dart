import 'package:flutter/material.dart';
import 'package:inametstatics/api/previsao_api.dart';
import 'package:inametstatics/model/previsao_model.dart';
import 'package:inametstatics/widgets/error_widget.dart';
import 'package:inametstatics/widgets/header_stastic_widget.dart';
import 'package:inametstatics/widgets/progressbar_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({this.provincia});
  final String provincia;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PrevisaoApi _api = PrevisaoApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.provincia}"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF212121),
      ),
      backgroundColor: Color(0xFF161414),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
                future: _api.buscaPrevisao(widget.provincia),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return progressBarWidget(context);
                  } else {
                    if (snapshot.hasData) {
                      PrevisaoModel model = snapshot.data;
                      final previsao = model.previsao;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          headerStatisticWidget(
                              context, model.provincia, previsao),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                itemWidget('Nuvem', previsao.coberturaDeNuvens,
                                    'nuvens.png'),
                                itemWidget(
                                    'Pressão', previsao.presso, 'pressao.png'),
                                itemWidget(
                                    'Vento', previsao.vento, 'vento.png'),
                                itemWidget('Humidade', previsao.humidade,
                                    'humidade.png'),
                                itemWidget('Ultra violetas',
                                    previsao.ultraVioletas, 'pressao.png'),
                                itemWidget('Temperatura Sentida',
                                    previsao.temperaturaSentida, 'nuvens.png'),
                              ],
                            ),
                          )
                        ],
                      );
                    } else {
                      return errorWidget(context, () {
                        setState(() {});
                      });
                    }
                  }
                }),
          ),
        ),
      ),
    );
  }

  itemWidget(String label, String value, String img) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Image.asset("images/$img", width: 150),
          Text(
            "$label",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "$value",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
