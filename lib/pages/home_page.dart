import 'package:flutter/material.dart';
import 'package:pronto_service/utils/app_routes.dart';

import '../utils/app_routes.dart';
import 'menu_card.dart';

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
                  leading: Icon(Icons.build),
                  title: Text('Serviços'),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.SERVICOS);
                  }),
              ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Cadastro de usuários'),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.USUARIOS);
                  }),
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
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(16),
            children: [
              for (final menuItem in menuItems) ...[
                menuItem,
              ],
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // para colocar mais de 3 itens
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Serviços',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Minhas contratações',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          selectedItemColor: Colors.blue,
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                break;
              case 1:
                Navigator.of(context).pushNamed(AppRoutes.SERVICOS);
                break;
              case 2:
                Navigator.of(context).pushNamed(AppRoutes.MINHAS_CONTRATACOES);
                break;
              case 3:
                Navigator.of(context).pushNamed(AppRoutes.USUARIOS);
                break;
              default:
                break;
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
