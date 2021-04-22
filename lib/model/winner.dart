
import 'package:atividade_des_movel/views/jogo_velha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Winner {

  final List<String> symbols;

  bool hasWinner = false;

  Winner({@required this.symbols});

  // Função que verifica se houve um vencedor
  void checkWinner(BuildContext context) {
    // Checando vitória do jogador "X"
    /* X X X
    *  - - -
    *  - - -*/
    if ((this.symbols[0] == "X") &&
        (this.symbols[1] == "X") &&
        (this.symbols[2] == "X")) {
      _showWinnerDialog(context, "X");

      /* - - -
      *  X X X
      *  - - -*/
    } else if (this.symbols[3] == "X" &&
        (this.symbols[4] == "X") &&
        (this.symbols[5] == "X")) {
      _showWinnerDialog(context, "X");
    }

    /* - - -
      *  - - -
      *  X X X*/
    else if ((this.symbols[6] == "X") &&
        (this.symbols[7] == "X") &&
        (this.symbols[8] == "X")) {
      _showWinnerDialog(context, "X");

      /* X - -
      *  X - -
      *  X - -*/
    } else if ((this.symbols[0] == "X") &&
        (this.symbols[3] == "X") &&
        this.symbols[6] == "X") {
      _showWinnerDialog(context, "X");
    }

    /* - X -
      *  - X -
      *  - X - */
    else if ((this.symbols[1] == "X") &&
        (this.symbols[4] == "X") &&
        (this.symbols[7] == "X")) {
      _showWinnerDialog(context, "X");
    }
    /* - - X
      *  - - X
      *  - - X */
    else if (this.symbols[2] == "X" &&
        (this.symbols[5] == "X") &&
        (this.symbols[8] == "X")) {
      _showWinnerDialog(context, "X");
    }

    /* X - -
    *  - X -
    *  - - X */
    else if ((this.symbols[0] == "X") &&
        (this.symbols[4] == "X") &&
        (this.symbols[8] == "X")) {
      _showWinnerDialog(context, "X");
    }

    /* - - X
      *  - X -
      *  X - - */
    else if ((this.symbols[2] == "X") &&
        (this.symbols[4] == "X") &&
        (this.symbols[6] == "X")) {
      _showWinnerDialog(context, "X");
    }

    // Checando vitória do jogador "O"
    /* O O O
    *  - - -
    *  - - -*/
    if ((this.symbols[0] == "O") &&
        (this.symbols[1] == "O") &&
        (this.symbols[2] == "O")) {
      _showWinnerDialog(context, "O");

      /* - - -
      *  0 0 0
      *  - - -*/
    } else if (this.symbols[3] == "O" &&
        (this.symbols[4] == "O") &&
        (this.symbols[5] == "O")) {
      _showWinnerDialog(context, "O");
    }

    /*   - - -
      *  - - -
      *  O O O*/
    else if ((this.symbols[6] == "O") &&
        (this.symbols[7] == "O") &&
        (this.symbols[8] == "O")) {
      _showWinnerDialog(context, "O");

      /* O - -
      *  O - -
      *  O - -*/
    } else if ((this.symbols[0] == "O") &&
        (this.symbols[3] == "O") &&
        this.symbols[6] == "O") {
      _showWinnerDialog(context, "O");
    }

    /*   - O -
      *  - O -
      *  - O - */
    else if ((this.symbols[1] == "O") &&
        (this.symbols[4] == "O") &&
        (this.symbols[7] == "O")) {
      _showWinnerDialog(context, "O");
    }
    /* - - O
      *  - - O
      *  - - O */
    else if (this.symbols[2] == "O" &&
        (this.symbols[5] == "O") &&
        (this.symbols[8] == "O")) {
      _showWinnerDialog(context, "O");
    }

    /* O - -
    *  - O -
    *  - - O */
    else if ((this.symbols[0] == "O") &&
        (this.symbols[4] == "O") &&
        (this.symbols[8] == "O")) {
      _showWinnerDialog(context, "O");
    }

    /* - - O
      *  - O -
      *  O - - */
    else if ((this.symbols[2] == "O") &&
        (this.symbols[4] == "O") &&
        (this.symbols[6] == "O")) {
      _showWinnerDialog(context, "O");
    }

    // Deu velha
    int velhaCounter = 0;

    for (String s in this.symbols) {
      if (s != "") velhaCounter++;

      if ( (velhaCounter == this.symbols.length) && !this.hasWinner ) {
        _showVelhaDialog(context);
      }
    }
  }

  // Caso em que deu velha
  _showVelhaDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
            content: Text("Deu velha...! :(",
                style: TextStyle(color: Colors.amber, fontSize: 30.0)),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => JogoVelha()));
                },
                child: Text("Ok"),
              )
            ]));
  }

  // Mostra a tela de vitória do jogador atual
  void _showWinnerDialog(BuildContext context, String winner) {
    this.hasWinner = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
            content: Text("Jogador $winner Venceu!",
                style: TextStyle(color: Colors.amber, fontSize: 30.0)),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => JogoVelha()));
                },
                child: Text("Ok"),
              )
            ]));
  }
}