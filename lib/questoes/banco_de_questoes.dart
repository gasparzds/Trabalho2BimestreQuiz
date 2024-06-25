class Pergunta {
  String enunciado;
  List<String> respostas;
  int respostaCorretaIndex;

  Pergunta({
    required this.enunciado,
    required this.respostas,
    required this.respostaCorretaIndex,
  });
}

List<Pergunta> bancoDePerguntas = [];

void adicionarPergunta(Pergunta pergunta) {
  bancoDePerguntas.add(pergunta);
}