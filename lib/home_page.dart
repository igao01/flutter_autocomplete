import 'package:autocomplete/adress_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // LISTA CONTENDO O ITEM QUE SERA BUSCADO
  List<String> fruits = ['banana', 'morango', 'melancia'];
  AdressViewmodel adressViewmodel = AdressViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto complete'),
      ),
      body: Column(
        children: [
          //WIDGET DE AUTOCOMPLETE
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              // VERIFICA SE TEXTO ESTA VAZIO
              if (textEditingValue.text.isEmpty) {
                return const Iterable.empty();
              }
              // BUSCAR O CEP
              setState(() {
                adressViewmodel.getCep(textEditingValue.text);
              });

              // EXIBE O RESULTADO DA BUSCA DO CEP
              return adressViewmodel.items.where((element) =>
                  element.contains(textEditingValue.text.toLowerCase()));

              //BUSCA NA LISTA fruits O QUE FOI DIGITADO NO CAMPO DE TEXTO
              // return fruits.where((element) => element.contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: (item) {
              // EXECUTA UMA ACAO QUANDO O ITEM FOR SELECIONADO - ao clicar ele preenche o autocomplete automaticamente
              print('The $item was selected');
            },
          ),
         // ElevatedButton(onPressed: () {}, child: const Text('buscar cep'))
        ],
      ),
    );
  }
}
