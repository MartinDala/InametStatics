import 'dart:convert';

PrevisaoModel previsaoModelFromJson(String str) =>
    PrevisaoModel.fromJson(json.decode(str));

class PrevisaoModel {
  PrevisaoModel({
    this.status,
    this.provincia,
    this.previsao,
  });

  int status;
  String provincia;
  PrevisaoHoje previsao;

  factory PrevisaoModel.fromJson(Map<String, dynamic> json) => PrevisaoModel(
        status: json["status"],
        provincia: json["provincia"],
        previsao: PrevisaoHoje.fromJson(json["previsao_de_tempo_actual"]),
      );
}

class PrevisaoHoje {
  PrevisaoHoje({
    this.tempoImage,
    this.descrissao,
    this.temperatura,
    this.humidade,
    this.vento,
    this.temperaturaSentida,
    this.temperaturaSentidaNaSombra,
    this.precepitaoLtimaHora,
    this.ultraVioletas,
    this.coberturaDeNuvens,
    this.presso,
  });

  String tempoImage;
  String descrissao;
  String temperatura;
  String humidade;
  String vento;
  String temperaturaSentida;
  String temperaturaSentidaNaSombra;
  String precepitaoLtimaHora;
  String ultraVioletas;
  String coberturaDeNuvens;
  String presso;

  factory PrevisaoHoje.fromJson(Map<String, dynamic> json) => PrevisaoHoje(
        tempoImage: json["weather_image_url"],
        descrissao: json["Descrição"],
        temperatura: json["Temperatura"],
        humidade: json["Humidade"],
        vento: json["Vento"],
        temperaturaSentida: json["Temperatura Sentida"],
        temperaturaSentidaNaSombra: json["Temperatura Sentida na Sombra"],
        precepitaoLtimaHora: json["Precepitação (última hora)"],
        ultraVioletas: json["Ultra Violetas"],
        coberturaDeNuvens: json["Cobertura de Nuvens"],
        presso: json["Pressão"],
      );
}
