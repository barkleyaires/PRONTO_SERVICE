import 'package:flutter/material.dart';
import 'package:pronto_service/components/usuario_item.dart';
import 'package:pronto_service/models/usuario.dart';
import 'package:pronto_service/models/usuario_list.dart';
import 'package:provider/provider.dart';

class UsuarioGrid extends StatelessWidget {
  Widget build(BuildContext context) {
    final provider = Provider.of<UsuarioList>(context);
    final List<Usuario> loadedUsuario = provider.itens;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      // deixar aparecendo apenas a quantidade de intens da carga
      itemCount: loadedUsuario.length,
      itemBuilder: (context, indice) => ChangeNotifierProvider(
        create: (_) => loadedUsuario[indice],
        child: UsuarioItem(),
      ),
      // definindo uma estrutura de grid view com 2 elementos em cada linha
      // SliverGridDelegateWithFixedCrossAxisCount = Cria layouts de grade com um número fixo de blocos no eixo transversal.
      gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
        //qtd de colunas
        crossAxisCount: 2,
        //espaçamento
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      )),
    );
  }
}
