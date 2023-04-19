import 'package:flutter/material.dart';
import 'package:pronto_service/components/usuario_grid.dart';

class UsuarioOverviewPage extends StatelessWidget {
  UsuarioOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tela de usuario'),
      ),
      body: UsuarioGrid(),
    );
  }
}

  
