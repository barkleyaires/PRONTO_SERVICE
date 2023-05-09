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
        elevation: 8, // adiciona a sombra
        child: Center(
          child: ListTile(
            leading: Icon(
              icon,
              color: textColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<MenuCard> menuItems = [
  MenuCard(
      title: 'Contratar Serviço', subtitle: '', icon: Icons.add_circle_outline),
  MenuCard(title: 'Minhas Contratações', subtitle: '', icon: Icons.assignment),
  MenuCard(title: 'Serviços', subtitle: '', icon: Icons.plumbing),
  MenuCard(title: 'Parceiros', subtitle: '', icon: Icons.people),
  MenuCard(title: 'Ajuda', subtitle: '', icon: Icons.help),
];
