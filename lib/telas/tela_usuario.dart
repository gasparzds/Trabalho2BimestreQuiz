import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jogo_do_quiz/telas/tela_quiz.dart';

class TelaUsuario extends StatefulWidget {
  const TelaUsuario({super.key});

  @override
  _TelaUsuarioState createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  TextEditingController nomeController = TextEditingController();
  bool isNomeButtonEnabled = false;
  Position? currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar com seu nome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                hintText: 'Digite seu nome aqui',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isNomeButtonEnabled
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaQuiz(userName: nomeController.text)),
                );
              }
                  : null,
              child: Text('Gravar Nome'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                currentPosition = await _determinePosition();
                setState(() {
                  isNomeButtonEnabled = true;  // Habilita o botão de Gravar Nome
                });
              },
              child: Text('PERMITIR ACESSO A MINHA LOCALIZAÇÃO'),
            ),
          ],
        ),
      ),
    );
  }

  // Método para obter localização
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
