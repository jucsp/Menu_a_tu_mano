import 'package:flutter/material.dart';

class Categoria extends StatefulWidget {
  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categoria 1"),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/wallpaper_login.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
            child: ListView(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("Clic en la imagen");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Categoria()));
                    },
                    child: Image.asset('assets/images/fondo.png'),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Plato 1'),
                    subtitle: Text("Descripcion del plato"),
                    onTap: () {
                      print("presiono tarjeta");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Categoria()));
                    },
                  ),
                  FlatButton(onPressed: null, child: Text("Detalles"))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
