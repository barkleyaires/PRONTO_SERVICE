import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuários',
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'PRONTO SERVICE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Cadastro de usuários'),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.USUARIOS);
                  }),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Perfil'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text('PRONTO SERVICE')),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
