import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'tela_inicial.dart';

class TelaResultados extends StatelessWidget {
  final int score;
  final Position? userLocation;

  const TelaResultados({super.key, required this.score, this.userLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você acertou $score perguntas!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (userLocation != null)
              Text(
                'Sua localização: ${userLocation!.latitude}, ${userLocation!.longitude}',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaInicial()),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('Voltar para o Início'),
            ),
          ],
        ),
      ),
    );
  }
}
