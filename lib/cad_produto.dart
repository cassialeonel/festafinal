import 'package:cloud_firestore/cloud_firestore.dart';

class Cad_Produto{
  String descricao="";
  String valor="";
//String imagem="";

  Cad_Produto();

  Map<String, dynamic> toJson() => {
    'descricao': descricao,
    'valor': valor
  };
  Cad_Produto.fromSnapshot(DocumentSnapshot snapshot):
      descricao = snapshot['descricao'],
      valor = snapshot['valor'];
}
