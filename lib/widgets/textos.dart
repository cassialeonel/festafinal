import 'package:flutter/material.dart';
class Textos extends StatelessWidget {
  String meuTexto;
  Color color;
  Textos(this.meuTexto, this.color);
  //Construtor da classe Textos com parametro "meuTexto"
  @override
  Widget build(BuildContext context) {
    //o metodo build retorna um tipo Text
    return Text(
      this.meuTexto, //parametro do construtor
      style: TextStyle( //texto estilizado
          color: this.color, //segundo parametro indicando a cor do texto
          //backgroundColor: Colors.black12,
          fontSize: 20
      ),
    );

  }
}
