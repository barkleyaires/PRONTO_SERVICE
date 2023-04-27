import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:validatorless/validatorless.dart';

import '../utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //usar global key para preservar o estado de uma arvore/grupo de widgets com o mesmo tipo,
  //evitando que o estado esteja desatualizado ao adicionar, remover ou reordenar widgets deste mesmo grupo.
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Página de Login')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // Serve para esticar e ocupar a tela inteira
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Bem vindo ao PRONTO SERVICE',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    'Faça login para entrar',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                  ),
                  //quando qualquer coisa for alterado ou sofrer alteração
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira o e-mail'),
                    Validatorless.email('Informe um e-mail válido')
                  ]),
                ),
                TextFormField(
                  controller: _senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha: ',
                  ),
                  validator: Validatorless.required('Insira a senha'),
                ),
                Text('Esqueceu a senha?'),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                    }
                  },
                  child: Text('Entrar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CRIARCONTA);
                  },
                  child: Text('Criar Conta'),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
