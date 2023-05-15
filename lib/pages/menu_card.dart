import 'package:flutter/material.dart';
import 'package:pronto_service/pages/ajuda.dart';
import 'package:pronto_service/pages/servicos.dart';
import 'package:pronto_service/pages/usuarios.dart';

import 'minhas_contratacoes.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  const MenuCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Contratar Serviço':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Servicos()),
            );
            break;
          case 'Minhas Contratações':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MinhasContratacoes()),
            );
            break;
          case 'Serviços':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Servicos()),
            );
            break;
          case 'Parceiros':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Usuarios()),
            );
            break;
          case 'Ajuda':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ajuda()),
            );
            break;
          default:
            break;
        }
      },
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: textColor,
              size: 48,
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<MenuCard> menuItems = [
  MenuCard(
    title: 'Contratar Serviço',
    subtitle: '',
    icon: Icons.add_circle_outline,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
  ),
  MenuCard(
    title: 'Minhas Contratações',
    subtitle: '',
    icon: Icons.assignment,
    backgroundColor: Colors.orange,
    textColor: Colors.white,
  ),
  MenuCard(
    title: 'Serviços',
    subtitle: '',
    icon: Icons.plumbing,
    backgroundColor: Colors.green,
    textColor: Colors.white,
  ),
  MenuCard(
    title: 'Parceiros',
    subtitle: '',
    icon: Icons.people,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  ),
  MenuCard(
    title: 'Ajuda',
    subtitle: '',
    icon: Icons.help,
    backgroundColor: Colors.purple,
    textColor: Colors.white,
  ),
];
