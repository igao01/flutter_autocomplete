import 'package:autocomplete/adress_api.dart';
import 'package:autocomplete/adress_model.dart';

class AdressViewmodel {
  AdressApi adressApi = AdressApi();

  List<String> items = [];

  getCep(String text) async {
    if (text.length == 8) {
      
      Adress adressResponse = await adressApi.searchCepApi(text);

      // CONCATENA LOGRADOURO E O CEP, ADICIONA NA LISTA DE ENDERECOS
      items.add('${adressResponse.logradouro}  ${adressResponse.cep}');

      print('ITEMS ' + items[0]);
    }
    print('LENGHT ${text.length}');
  }
}
