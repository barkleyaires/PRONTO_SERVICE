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
                child: Text(
                  'PRONTO SERVICE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
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
          title: Text('Usuários'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USUARIOS);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Quantidade de cards que você deseja exibir
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text('Usuário'),
                      subtitle: Text('teste@gmail.com'),
                      leading: Icon(Icons.account_circle), // Ícone do card
                      trailing: Icon(Icons.edit), // Ícone de navegação
                      onTap: () {
                        // Ação a ser executada quando o card for clicado
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
