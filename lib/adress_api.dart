import 'dart:convert';
import 'package:http/http.dart' as http;

import 'adress_model.dart';

class AdressApi {
  Future<Adress> searchCepApi(String text) async {
    
    var url = Uri.parse('https://viacep.com.br/ws/$text/json/');

    // Fazendo a requisição GET
    var response = await http.get(url);

    // Verifica se a requisição foi bem-sucedida
    if (response.statusCode == 200) {

      // Decodificando a resposta JSON
      var data = json.decode(response.body);

      // Processando os dados
      print(data);
      return Adress.fromJson(data);
    } else {
      print('Erro na requisição: ${response.statusCode}');
      return Adress(cep: '');
    }
  }
}
