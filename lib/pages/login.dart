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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmSenhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _confirmSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Página de login')),
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
                Text(
                  'Faça login com seus dados',
                  style: TextStyle(fontSize: 20),
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
                TextFormField(
                  controller: _confirmSenhaController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha: ',
                  ),
                   validator: Validatorless.multiple([
                    Validatorless.required('Confirme a senha'),
                    Validatorless.compare(_senhaController, 'As senhas devem ser as mesmas')
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {}

                    //   Navigator.of(context).pushNamed(AppRoutes.HOME);
                  },
                  child: Text('Entrar'),
                ),
                Text('Esqueceu a senha?'),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
