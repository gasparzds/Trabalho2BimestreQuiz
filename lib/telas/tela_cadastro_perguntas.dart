import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/database/database.dart';  // Ajuste o caminho conforme necessário

class TelaCadastroPerguntas extends StatelessWidget {
  final TextEditingController enunciadoController = TextEditingController();
  final List<TextEditingController> respostaControllers = List.generate(4, (_) => TextEditingController());
  final TextEditingController corretaIndexController = TextEditingController();

  TelaCadastroPerguntas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Perguntas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: enunciadoController,
              decoration: const InputDecoration(
                labelText: 'Digite a pergunta aqui',
                border: OutlineInputBorder(),
                hintText: 'Pergunta',
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(respostaControllers.length, (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: respostaControllers[index],
                decoration: InputDecoration(
                  labelText: 'Resposta ${index + 1}',
                  border: const OutlineInputBorder(),
                  hintText: 'Resposta ${index + 1}',
                ),
              ),
            )),
            TextField(
              controller: corretaIndexController,
              decoration: const InputDecoration(
                labelText: 'Índice da resposta correta (0-3)',
                border: OutlineInputBorder(),
                hintText: '0, 1, 2 ou 3',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Map<String, dynamic> perguntaData = {
                  'enunciado': enunciadoController.text,
                  'respostaCorretaIndex': int.parse(corretaIndexController.text),
                  'opcao1': respostaControllers[0].text,
                  'opcao2': respostaControllers[1].text,
                  'opcao3': respostaControllers[2].text,
                  'opcao4': respostaControllers[3].text,
                };
                await DatabaseHelper.instance.addPergunta(perguntaData);
                Navigator.pop(context); // Retorna à tela anterior
              },
              child: const Text('Salvar Pergunta'),
            ),
          ],
        ),
      ),
    );
  }
}
