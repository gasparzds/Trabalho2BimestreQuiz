import 'package:flutter/material.dart';
import 'package:jogo_do_quiz/database/Database.dart';

class TelaVisualizarPerguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizar Perguntas"),
      ),
      body: FutureBuilder<List<Pergunta>>(
        future: DatabaseHelper.instance.getPerguntas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pergunta = snapshot.data![index];
                return ListTile(
                  title: Text(pergunta.enunciado),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DatabaseHelper.instance.deletePergunta(pergunta.id);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaVisualizarPerguntas()));
                    },
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
