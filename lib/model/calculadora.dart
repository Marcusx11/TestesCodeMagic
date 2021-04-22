// Classe de modelo de negócio = executa coisas
import 'package:flutter/cupertino.dart';

class Calculadora {

  double getAdicao(double p1, double p2) {
    return p1 + p2;
  }

  double getSubtracao(double p1, double p2) {
    return p1 - p2;
  }

  double getMultiplicacao(double p1, double p2) {
    return p1 * p2;
  }

  double getDivisao(double p1, double p2) {
    if (p2 == 0) return null;
    return p1 / p2;
  }
}