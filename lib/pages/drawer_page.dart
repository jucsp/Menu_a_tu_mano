import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_a_tu_mano/pages/carro.dart';

import 'home.dart';
import 'login.dart';

// ignore: must_be_immutable
class DrawerPage extends StatefulWidget {
  String nroMesa;

  DrawerPage(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  _DrawerPageState createState() => _DrawerPageState(this.nroMesa);
}

class _DrawerPageState extends State<DrawerPage> {
  String nroMesa;

  _DrawerPageState(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  image: DecorationImage(
                      image: AssetImage('assets/images/wallpaper_login.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: new Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        height: 118,
                      )),
                  Text(
                    'Menu a tu mano - $nroMesa',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(this.nroMesa)));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Carrito', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Carro(this.nroMesa)));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Desconectar', style: TextStyle(fontSize: 18)),
              onTap: () {
                SystemChannels.platform.invokeMapMethod('SystemNavigator.pop');
              },
            )
          ],
        ),
      ),
    );
  }
}
