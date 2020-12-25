import 'package:flutter/material.dart';
import './respostafinal.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Verde', 'ponto': 10},
        {'texto': 'Vermelho', 'ponto': 5},
        {'texto': 'Preto', 'ponto': 3},
        {'texto': 'Azul', 'ponto': 1},
      ]
    },
    {
      'texto': 'Qual é seu animal favorita?',
      'respostas': [
        {'texto': 'Leão', 'ponto': 10},
        {'texto': 'Canguru', 'ponto': 8},
        {'texto': 'Porco', 'ponto': 6},
        {'texto': 'Bufalo', 'ponto': 4},
      ]
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leonardo', 'ponto': 10},
        {'texto': 'Pedro', 'ponto': 8},
        {'texto': 'João', 'ponto': 5},
        {'texto': 'Maria', 'ponto': 3},
      ]
    }
  ];

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder)
          : RespostaFinal(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
