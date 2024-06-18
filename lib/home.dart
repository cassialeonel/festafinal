import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'cliente.dart';
import 'pedido.dart';
import 'produto.dart';
import 'widgets/botoes.dart';
import 'widgets/textos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  String _autorized = 'NOT';
  String _msg = "";
  late FirebaseAuth _auth;
  Color _colors = Colors.red as Color;

  @override
  Widget build(BuildContext context) {
    _initFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Textos('Festa na Caixa', Colors.white),
        backgroundColor: Colors.blueAccent,
        actions: [
          Buttons('Produtos', onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Produto()));}),
          Buttons('Pedidos', onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Pedido()));}),
          Buttons('Clientes', onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cliente()));})
        ],
      ),
      body: Container(
        color: Colors.pink[50], // Cor de fundo do corpo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textos('', Colors.black)
            ],
          ),
        ),
      ),
    );
  }

  Future <void> _initFirebase() async{
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  Future <void> _authenticate() async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email.text.toString(),
          password: _pwd.text.toString()
      );
      _autorized = "Yes, user is connected.";
      _colors = Colors.blueAccent as Color;
      _msg = userCredential.toString();
    } catch(e){
      _autorized = "Nop, email or password incorrect.";
      _colors = Colors.redAccent as Color;
      _msg = e.toString();
    }
    setState(() {
    });
  }

  Future <void> _createUser() async{
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
            email: _email.text,
            password: _pwd.text,
        );
        print('Account has created: ${userCredential.user?.email}');
      } catch(e) {
        print('Error, Please try again: $e');
      }
  }
}
