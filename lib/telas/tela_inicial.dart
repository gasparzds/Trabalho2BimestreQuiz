import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/telas/tela_instrucoes.dart';
import 'package:jogo_do_quiz/telas/tela_usuario.dart';
import 'package:jogo_do_quiz/telas/tela_cadastro_perguntas.dart'; // Importação da nova tela

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/telainicial.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 30),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaUsuario()),
                  );
                },
                child: const Text('ESTOU PREPARADO!'),
              ),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white ,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaInstrucoes()),
                  );
                },
                child: const Text('INSTRUÇÕES'),
              ),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TelaCadastroPerguntas()),
                  );
                },
                child: const Text("CADASTRAR PERGUNTAS"),
              ),
              SizedBox(height: 20),

              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaVisualizarPerguntas()),
                  );
                },
                child: const Text("VISUALIZAR PERGUNTAS"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 10),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("SAIR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}