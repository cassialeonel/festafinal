import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festanacaixa/cad_produto.dart';
import 'package:firebase_core/firebase_core.dart';

import 'widgets/botoes.dart';
import 'widgets/input.dart';
import 'package:flutter/material.dart';
import 'widgets/textos.dart';

class Produto extends StatefulWidget {

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  final _descricao = TextEditingController();
  final _valor = TextEditingController();
  final _imagem = TextEditingController();

  Future <void> inicializarFirebase() async{
    await Firebase.initializeApp();
    Firebase.initializeApp().whenComplete(() => print("Conectado Firebase!"));
  }

  @override
  Widget build(BuildContext context) {
    inicializarFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Textos('Festa na Caixa', Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.pink[50], // Cor de fundo do corpo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textos('Festa na Caixa', Colors.black),
              Text('Novo Produto'),
              SizedBox(height: 20),
              Input(_descricao, 'Descrição do Produto'),
              Input(_valor, 'Valor do Produto'),
              Input(_imagem, 'Imagem do Produto'),
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add), // Ícone do botão
                    onPressed: _salvar,
                  ),
                  SizedBox(width: 10), // Espaçamento entre o botão e o texto
                  Text('Adicionar Produto'),
                ],
              ),
              SizedBox(height: 40),
              Text('Produtos Cadastrados')
            ],
          ),
        ),
      ),
    );
  }

  void _salvar() {
    Cad_Produto pr = new Cad_Produto();
    pr.descricao = _descricao.text.toString().trim();
    pr.valor = _valor.text.toString().trim();

    CollectionReference instanciaColecaoFirestore = FirebaseFirestore.instance.collection("msg");
    Future<void> addPro(){
      return instanciaColecaoFirestore
          .doc(pr.toString().trim())
          .set(pr.toJson())
          .then((value) => print("Mensagem adicionada"))
          .catchError((onError) => print("Erro ao gravar no banco $onError"));
    }
    addPro();
  }
}