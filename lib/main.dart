import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart'; // Importe a tela inicial aqui

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blue,
      ),
      home: const TelaInicial(), // Utilize a TelaInicial importada
    );
  }
}