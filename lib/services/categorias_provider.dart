import 'package:flutter/services.dart';
import 'dart:convert';

class _CategoriasProvider {
  List<dynamic> categorias = [];

  _CategoriasProvider() {}

  Future<List<dynamic>> loadCategorias() async {
    final String categoriasJson =
        await rootBundle.loadString('assets/json/Categorias.json');

    Map categoriasMap = json.decode(categoriasJson);
    categorias = categoriasMap['categorias'];

    return categorias;
  }
}

final categoriasProvider = new _CategoriasProvider();
