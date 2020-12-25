import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final void Function(int) responder;
  final List<Map<String, Object>> perguntas;

  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(resp['texto'], () => responder(resp['ponto']));
        }).toList(),
      ],
    );
  }
}
