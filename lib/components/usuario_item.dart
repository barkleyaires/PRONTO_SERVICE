import 'package:flutter/material.dart';
import 'package:pronto_service/models/usuario.dart';
import 'package:pronto_service/utils/app_routes.dart';
import 'package:provider/provider.dart';

class UsuarioItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<Usuario>(
      context,
      listen: false,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            usuario.imageUrl,
            //caso queira colocar zoom no elemento fit: BoxFit.cover,
          ),
          //definindo a navegação de página
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.USUARIO_DETAIL, arguments: usuario);
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.blue,
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          title: Text(usuario.nome, textAlign: TextAlign.center),
          // trailing: IconButton(      onPressed: () {},             icon: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
