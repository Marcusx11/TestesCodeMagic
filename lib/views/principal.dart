import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// Padrão de texto
final styleLabel =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500);

class Principal extends StatefulWidget {

  @override
  _PrincipalState createState() => _PrincipalState();
}

// _ = operador de encapsulamento no dart
class _PrincipalState extends State<Principal> {

  String texto = "";

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Digite abaixo:",
              style: styleLabel, textAlign: TextAlign.center),

          Padding(padding: EdgeInsets.all(10.0)),

          TextField(
            controller: this._textController,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)), labelStyle: TextStyle(color: Colors.amber)),
          ),

          Padding(padding: EdgeInsets.all(10.0)),

          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.5, 0.0, 0.0),
            child: ButtonTheme(
              height: 60,
              child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  setState(() {
                    if (this._textController.text == "") {
                      Toast.show("Digite algo no campo!", context);
                    } else {
                      this.texto = this._textController.text;
                      this._textController.text = "";
                    }
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)
                ),
                child: Text("Mostrar", style: styleLabel),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.5, 0.0, 0.0),
            child: Text("Texto digitado: ${this.texto}",
                style: styleLabel, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
