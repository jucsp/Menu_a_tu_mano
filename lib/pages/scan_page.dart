import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:menu_a_tu_mano/pages/home.dart';

class QrScan extends StatefulWidget {
  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Escaneé su mesa'),
        ),
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/images/wallpaper_qr.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 500,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.yellow,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        scan();
                      },
                      child: Text("Scan", textAlign: TextAlign.center),
                    ),
                  ))
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      print(barcode);
      if (barcode != null && barcode.contains("mesa")) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(barcode.toString())));
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('El usuario no dio permiso para el uso de la cámara!');
      } else {
        print('Error desconocido $e');
      }
    } on FormatException {
      print('El usuario presionó el botón de volver antes de escanear algo!');
    } catch (e) {
      print('Error desconocido : $e');
    }
  }
}
