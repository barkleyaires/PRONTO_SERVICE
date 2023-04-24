import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pronto_service/components/usuario_form.dart';
import 'package:pronto_service/pages/resultPage.dart';

class Usuarios extends StatelessWidget {
  const Usuarios({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuario'),
        actions: [
          IconButton(
            onPressed: () {
              String nome = nomeController.text;
              String email = emailController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => resultPage(nome, email)),
              );
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String nome = nomeController.text;
                String email = emailController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => resultPage(nome, email)),
                );
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
