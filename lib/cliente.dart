import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'widgets/input.dart';
import 'widgets/textos.dart';
//import 'widgets/botoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cliente extends StatefulWidget {
  const Cliente({super.key});

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  final _concli = TextEditingController();
  @override
  Future <void> inicializarFirebase() async{
    await Firebase.initializeApp();
    Firebase.initializeApp().whenComplete(() => print("Conectado Firebase!"));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos('Festa na Caixa', Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.yellow[50], // Cor de fundo do corpo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textos('Festa na Caixa', Colors.black),
              Text('Clientes Cadastrados'),
              SizedBox(height: 20),
              TextField(
                controller: _concli,
                decoration: InputDecoration(
                  hintText: 'Consultar Cliente',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _buscarClientes(_concli.text);
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text('Clientes Encontrados')
            ],
          ),
        ),
      ),
    );
  }

  void _buscarClientes(String text) {
    FirebaseFirestore.instance
        .collection('clientes')
        .where('nome', isEqualTo: _concli)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    }).catchError((error) {
      print("Erro ao buscar clientes: $error");
    });
  }
}