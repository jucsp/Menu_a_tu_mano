import 'package:flutter/material.dart';
import 'package:menu_a_tu_mano/pages/drawer_page.dart';

// ignore: must_be_immutable
class Carro extends StatefulWidget {
  String nroMesa;

  Carro(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  _CarroState createState() => _CarroState(this.nroMesa);
}

class _CarroState extends State<Carro> {
  String nroMesa;

  _CarroState(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carrito"),
          backgroundColor: Colors.yellow[700],
        ),
        drawer: DrawerPage(this.nroMesa),
        body: Center(
          child: Text("Aqui iria el carrito :)"),
        ));
  }
}
