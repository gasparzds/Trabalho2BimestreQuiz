import 'package:flutter/material.dart';

class TelaInstrucoes extends StatelessWidget {
  const TelaInstrucoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instruções do Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Bem-vindo ao Quiz!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('Instruções:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('1. Leia cada pergunta cuidadosamente.',
                  style: TextStyle(fontSize: 18)),
              Text('2. Selecione a resposta que você acredita ser a correta.',
                  style: TextStyle(fontSize: 18)),
              Text('3. Cada pergunta correta concede um ponto.',
                  style: TextStyle(fontSize: 18)),
              Text('4. Não há penalidade por respostas incorretas.',
                  style: TextStyle(fontSize: 18)),
              Text('5. Divirta-se testando seu conhecimento!',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}