import 'package:flutter/material.dart';

class Plato extends StatefulWidget {
  @override
  _PlatoState createState() => _PlatoState();
}

class _PlatoState extends State<Plato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plato 1"),
        backgroundColor: Colors.yellow[700],
      ),
      body: null,
    );
  }
}
