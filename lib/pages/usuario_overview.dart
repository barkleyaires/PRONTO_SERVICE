import 'package:flutter/material.dart';
import 'package:pronto_service/components/usuario_grid.dart';

import '../utils/app_routes.dart';

class UsuarioOverviewPage extends StatelessWidget {
  UsuarioOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tela de usuario'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USUARIOS);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: UsuarioGrid(),
    );
  }
}
