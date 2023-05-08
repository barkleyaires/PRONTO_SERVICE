import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pronto_service/data/carga_usuarios_data.dart';
import 'package:pronto_service/models/usuario.dart';

class UsuarioList with ChangeNotifier {
  List<Usuario> _itens = dummyUsuarios;

  // retornando um clone da lista para não acessar o atributo real
  List<Usuario> get itens => [..._itens];

  void addUsuario(Usuario usuario) {
    _itens.add(usuario);
    //notificando os interessados sempre que algo for mudado, ou seja, sempre que adicionar um usuário
    notifyListeners();
  }
}
