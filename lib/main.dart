import 'package:flutter/material.dart';
import 'package:pronto_service/models/usuario_list.dart';
import 'package:pronto_service/pages/login.dart';
import 'package:pronto_service/pages/usuario_detail_page.dart';
import 'package:pronto_service/pages/usuario_overview.dart';
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
        // definindo a tela home
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          AppRoutes.HOME: (context) => UsuarioOverviewPage(),
          AppRoutes.USUARIO_DETAIL: (context) => UsuarioDetailPage(),
          AppRoutes.USUARIOS: (context) => Usuarios(),
        },
        //tirando o icone debug no canto superior
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
