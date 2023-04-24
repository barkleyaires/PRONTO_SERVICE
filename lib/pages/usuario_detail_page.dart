import 'package:flutter/material.dart';
import 'package:pronto_service/models/usuario.dart';

class UsuarioDetailPage extends StatelessWidget {
  const UsuarioDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // referenciando o argumento passado a partir da rota(route)
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;

    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Id: ${usuario.id}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nome: ${usuario.nome}',
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: ${usuario.email}',
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
