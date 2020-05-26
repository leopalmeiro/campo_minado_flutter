import 'package:campo_minado/components/resultado_wigdet.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explocao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro;

  void _reiniciar() {
    setState(() {
      _tabuleiro.reiniciar();
      _venceu = null;
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      campo.alternarMarcacao();
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();
      _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdeColunas,
        qtdBombas: 50,
      );
    }
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    /* Campo vizinho01 = Campo(linha: 1, coluna: 0);
    vizinho01.minar();
    Campo vizinho02 = Campo(linha: 1, coluna: 1);
    vizinho01.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho01);
    try {
      campo.alternarMarcacao();
    } on ExplosaoException {} */

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWigdet(
          venceu: _venceu,
          onReniciar: _reiniciar,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
