import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pronto_service/models/usuario.dart';

class UsuarioItem extends StatelessWidget {
  final Usuario usuario;
  const UsuarioItem({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            usuario.imageUrl,
            //zoom no elemento
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            title: Text(usuario.nome, textAlign: TextAlign.center),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ));
  }
}
