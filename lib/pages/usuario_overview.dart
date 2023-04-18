import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pronto_service/components/usuario_item.dart';
import 'package:pronto_service/data/dummy_data.dart';
import 'package:pronto_service/models/usuario.dart';

class UsuarioOverviewPage extends StatelessWidget {
  final List<Usuario> loadedUsuario = dummyUsuarios;
  UsuarioOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de usuario'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // deixar aparecendo apenas a quantidade de intens da carga
        itemCount: loadedUsuario.length,
        itemBuilder: (context, indice) =>
            UsuarioItem(usuario: loadedUsuario[indice]),
        // definindo uma estrutura de grid view com 2 elementos em cada linha
        gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
          //qtd de colunas
          crossAxisCount: 2,
          //espaçamento
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        )),
      ),
    );
  }
}
