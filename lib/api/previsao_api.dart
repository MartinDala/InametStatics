import 'package:http/http.dart' as http;
import 'package:inametstatics/model/previsao_model.dart';

class PrevisaoApi {
  Future<PrevisaoModel> buscaPrevisao(String provincia) async {
    String url =
        "https://angoprovsapi.herokuapp.com/api/v1/previsao/$provincia";

    try {
      final response = await http.get(url);

      if (response.statusCode == 200 && response != null)
        return previsaoModelFromJson(response.body);
    } catch (e) {}

    return null;
  }
}
