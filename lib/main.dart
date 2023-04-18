import 'package:flutter/material.dart';
import 'package:pronto_service/pages/usuario_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRONTO_SERVICE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // definindo a tela home
      home: UsuarioOverviewPage(),

      //tirando o icone debug no canto superior
      debugShowCheckedModeBanner: false,
    );
  }
}
