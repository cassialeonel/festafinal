import 'package:flutter/material.dart';
import 'widgets/input.dart';
import 'widgets/textos.dart';
import 'widgets/botoes.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final _conped = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos('Festa na Caixa', Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.blue[50], // Cor de fundo do corpo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textos('Festa na Caixa', Colors.black),
              Text('Pedidos Recebidos'),
              SizedBox(height: 20),
              TextField(
                  controller: _conped,
                  decoration: InputDecoration(
                    hintText: 'Consultar Pedido',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Ação quando o botão dentro do input é pressionado
                        print('Botão dentro do input pressionado');
                      },
                    ),
                  ),
              ),
              SizedBox(height: 40),
              Text('Pedidos Encontrados')
            ],
          ),
        ),
      ),
    );
  }
}