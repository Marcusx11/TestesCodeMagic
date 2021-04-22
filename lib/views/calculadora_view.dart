import 'package:atividade_des_movel/model/calculadora.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// Padrão de texto
final styleLabel =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500);

final borderDecoration = InputDecoration(
    fillColor: Colors.amber,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    labelStyle: TextStyle(color: Colors.amber));

final shape =
    RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0));

class CalculadoraView extends StatefulWidget {
  @override
  _CalculadoraViewState createState() => _CalculadoraViewState();
}

class _CalculadoraViewState extends State<CalculadoraView> {
  TextEditingController _valor1Controller = TextEditingController();
  TextEditingController _valor2Controller = TextEditingController();

  Calculadora _calculadora = Calculadora();

  double _finalRes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Campo para digitar os 2 números em linhas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.0,
                child: TextField(
                    controller: this._valor1Controller,
                    decoration: InputDecoration(
                        fillColor: Colors.amber,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        labelStyle: TextStyle(color: Colors.amber),
                        labelText: "Valor 1")),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
              Container(
                width: 200.0,
                child: TextField(
                    controller: this._valor2Controller,
                    decoration: InputDecoration(
                        fillColor: Colors.amber,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        labelStyle: TextStyle(color: Colors.amber),
                        labelText: "Valor 2")),
              )
            ],
          ),

          // Linha com os botões de operações da calculadora
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botão para adição
              _generateButton(Colors.amber, () {
                if (_valor1Controller.text == "" ||
                    _valor2Controller.text == "") {
                  Toast.show("Digite valores válidos!", context,
                      gravity: Toast.TOP);
                } else {
                  double _v1 = double.parse(_valor1Controller.text);
                  double _v2 = double.parse(_valor2Controller.text);

                  setState(() {
                    this._finalRes = _calculadora.getAdicao(_v1, _v2);
                  });

                  _valor1Controller.text = "";
                  _valor2Controller.text = "";
                }
              }, shape, Text("+")),

              Padding(padding: EdgeInsets.all(5.0)),

              // Botão para subtração
              _generateButton(Colors.amber, () {
                if (_valor1Controller.text == "" ||
                    _valor2Controller.text == "") {
                  Toast.show("Digite valores válidos!", context,
                      gravity: Toast.TOP);
                } else {
                  double _v1 = double.parse(_valor1Controller.text);
                  double _v2 = double.parse(_valor2Controller.text);

                  setState(() {
                    this._finalRes = _calculadora.getSubtracao(_v1, _v2);
                  });

                  _valor1Controller.text = "";
                  _valor2Controller.text = "";
                }
              }, shape, Text("-")),

              Padding(padding: EdgeInsets.all(5.0)),

              // Botão para multiplicação
              _generateButton(Colors.amber, () {
                if (_valor1Controller.text == "" ||
                    _valor2Controller.text == "") {
                  Toast.show("Digite valores válidos!", context,
                      gravity: Toast.TOP);
                } else {
                  double _v1 = double.parse(_valor1Controller.text);
                  double _v2 = double.parse(_valor2Controller.text);

                  setState(() {
                    this._finalRes = _calculadora.getMultiplicacao(_v1, _v2);
                  });

                  _valor1Controller.text = "";
                  _valor2Controller.text = "";
                }
              }, shape, Text("x")),

              Padding(padding: EdgeInsets.all(5.0)),

              // Botão para divisão
              _generateButton(Colors.amber, () {
                if (_valor1Controller.text == "" ||
                    _valor2Controller.text == "") {
                  Toast.show("Digite valores válidos!", context,
                      gravity: Toast.TOP);
                } else {
                  double _v1 = double.parse(_valor1Controller.text);
                  double _v2 = double.parse(_valor2Controller.text);

                  double res = _calculadora.getDivisao(_v1, _v2);
                  if (res == null)
                    Toast.show("Não é possível dividir por zero!", context,
                        gravity: Toast.TOP);
                  else {
                    setState(() {
                      this._finalRes = res;
                    });

                    _valor1Controller.text = "";
                    _valor2Controller.text = "";
                  }
                }
              }, shape, Text("/"))
            ],
          ),

          // Texto exibindo o resultado
          Text("Resultado: ${this._finalRes}",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  // Função para gerar botões
  RaisedButton _generateButton(Color color, Function onPress,
      RoundedRectangleBorder border, Text label) {
    return RaisedButton(
      color: color,
      onPressed: onPress,
      shape: border,
      child: label,
    );
  }
}
