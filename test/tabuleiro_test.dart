import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Ganhar Jogo', () {
    Tabuleiro tabuleiro = Tabuleiro(
      colunas: 2,
      linhas: 2,
      qtdBombas: 0,
    );
    // Jogando

    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();
    tabuleiro.campos[0].alternarMarcacao();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();
    tabuleiro.campos[3].alternarMarcacao();
    expect(tabuleiro.resolvido, isTrue);
  });
}
