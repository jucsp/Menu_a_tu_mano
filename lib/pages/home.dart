import 'package:flutter/material.dart';
import 'package:menu_a_tu_mano/pages/carro.dart';
import 'package:menu_a_tu_mano/pages/categoria.dart';
import 'package:menu_a_tu_mano/pages/drawer_page.dart';
import 'package:menu_a_tu_mano/services/categorias_provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  String nroMesa;

  MyHomePage(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  _MyHomePageState createState() => _MyHomePageState(this.nroMesa);
}

class _MyHomePageState extends State<MyHomePage> {
  String nroMesa;

  _MyHomePageState(String mesa) {
    this.nroMesa = mesa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.yellow[700],
      ),
      drawer: DrawerPage(this.nroMesa),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/wallpaper_login.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: getCategoria(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Carro(this.nroMesa)));
        },
        tooltip: 'Accion del boton',
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget getCategoria() {
    return FutureBuilder(
        future: categoriasProvider.loadCategorias(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> miListaWidget = new List<Widget>();

          snapshot.data.forEach((categorias) {
            Column tempWidget = Column(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Clic en la imagen");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categoria()));
                        },
                        child:
                            Image.asset('assets/images/${categorias['img']}'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text("${categorias['nombre']}"),
                        subtitle: Text("${categorias['descripcion']}"),
                        onTap: () {
                          print("presiono tarjeta");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categoria()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            );

            miListaWidget.add(tempWidget);
          });

          return ListView(
            children: miListaWidget,
          );
        });
  }
}
