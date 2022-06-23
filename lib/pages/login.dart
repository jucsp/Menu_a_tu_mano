import 'package:flutter/material.dart';
import 'package:menu_a_tu_mano/pages/scan_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget createLoginButton() {
    return Padding(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.yellow,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QrScan()));
            },
            child: Text("Ingresar", textAlign: TextAlign.center),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('assets/images/wallpaper_login.jpg'),
              fit: BoxFit.cover)),
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: ListView(children: [
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(child: Image.asset("assets/images/logo.png"))),
        SizedBox(
          height: 100,
        ),
        createLoginButton(),
      ]),
    ));
  }
}
