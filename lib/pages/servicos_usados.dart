import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ServicosUsados extends StatelessWidget {
  const ServicosUsados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MINHAS CONTRATAÇÕES'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Ar Condicionado'),
            subtitle: Text('Instalação, manutenção e reparo'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.construction),
            title: Text('Construção'),
            subtitle: Text('Pedreiro, pintor, eletricista e encanador'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text('Limpeza'),
            subtitle: Text('Faxina, lavagem a seco e limpeza de estofados'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
