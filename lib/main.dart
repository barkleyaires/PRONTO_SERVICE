import 'package:flutter/material.dart';
import 'package:pronto_service/models/usuario_list.dart';
import 'package:pronto_service/pages/criarConta.dart';
import 'package:pronto_service/pages/home_page.dart';
import 'package:pronto_service/pages/login.dart';
import 'package:pronto_service/pages/servicos.dart';
import 'package:pronto_service/pages/minhas_contratacoes.dart';
import 'package:pronto_service/pages/usuarios.dart';
import 'package:pronto_service/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //criando uma nova lista de usuarios
      create: (_) => UsuarioList(),
      child: MaterialApp(
        title: 'PRONTO_SERVICE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // definindo a rota inicial
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          AppRoutes.HOME_PAGE: (context) => HomePage(),
          AppRoutes.USUARIOS: (context) => Usuarios(),
          AppRoutes.CRIARCONTA: (context) => CriarConta(),
          AppRoutes.SERVICOS: (context) => Servicos(),
          AppRoutes.MINHAS_CONTRATACOES: (context) => MinhasContratacoes(),
        },
        //tirando o icone debug no canto superior
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
