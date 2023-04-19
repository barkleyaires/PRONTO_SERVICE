import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:pronto_service/models/usuario.dart';

class UsuarioDetailPage extends StatelessWidget {
  const UsuarioDetailPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // referenciando o argumento passado a partir da rota(route)
  final Usuario usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nome),
      ),
    );
  }
}
