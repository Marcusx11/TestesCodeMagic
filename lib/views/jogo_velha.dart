
import 'package:atividade_des_movel/model/winner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class JogoVelha extends StatefulWidget {
  @override
  _JogoVelhaState createState() => _JogoVelhaState();
}

class _JogoVelhaState extends State<JogoVelha> {
  // Cor de fundo que mudará o jogador do game
  Color _playerColor = Colors.red;

  ValueNotifier<String> _currentPlayerSymbol = ValueNotifier<String>("X");
  ValueNotifier _gameWinner = ValueNotifier(false);

  // Lista de símbolos dos botões
  List<Widget> _blockSymbols = <Widget>[
    Text(""),
    Text(""),
    Text(""),
    Text(""),
    Text(""),
    Text(""),
    Text(""),
    Text(""),
    Text("")
  ];

  // Lista para salvar os símbolos e verificar o vencedor
  List<String> _symbols = <String>["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("Jogo da Velha"), centerTitle: true, backgroundColor: Colors.indigo),
      body: ValueListenableBuilder<String>(
        valueListenable: _currentPlayerSymbol,
        builder: (context, value, _) => Center(
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children:
              List.generate(9, (index) => _buildButton(index, "", context))),
        ),
      ),
    );
  }

  Widget _buildButton(int index, String text, BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: RaisedButton(
          onPressed: () {
            if (this._symbols[index] == "") {
              this._blockSymbols[index] = Text(this._currentPlayerSymbol.value,
                  style: TextStyle(color: this._playerColor, fontSize: 70.0));

              // Salvando os valores para verificação do vencedor
              this._symbols[index] = this._currentPlayerSymbol.value;

              // Checando vencedor
              Winner(symbols: this._symbols).checkWinner(context);

              // Mudando-se as cores dos Players
              if (this._playerColor == Colors.red) {
                this._playerColor = Colors.blue;
              } else {
                this._playerColor = Colors.red;
              }

              // Mudando-se o símbolo
              if (this._currentPlayerSymbol.value == "X")
                this._currentPlayerSymbol.value = "O";
              else
                this._currentPlayerSymbol.value = "X";
            }
          },
          child: _blockSymbols[index],
        ));
  }
}
