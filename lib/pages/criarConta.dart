import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:validatorless/validatorless.dart';

import '../utils/app_routes.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({Key? key}) : super(key: key);

  //método de mensagem de confirmação
  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nomeController = TextEditingController();
    final _emailController = TextEditingController();
    final _senhaController = TextEditingController();
    final _confirmSenhaController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80.0),
                Text(
                  'Insira seus dados para realizar o cadastro',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Nome',
                    hintText: 'Insira seu nome',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira o nome'),
                    Validatorless.min(2, 'Mínimo de 2 letras')
                  ]),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'exemplo@dominio.com',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira o e-mail'),
                    Validatorless.email('Informe um e-mail válido')
                  ]),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira a senha'),
                    Validatorless.min(6, 'Insira no mínimo 6 caracteres')
                  ]),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _confirmSenhaController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Confirmar senha',
                    hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira a senha'),
                    Validatorless.compare(
                        _senhaController, 'As senhas devem ser a mesma')
                  ]),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                        _showSnackbar(
                      context, 'Cadastro realizado com sucesso!');
                    }
                  },
                  child: Text('Cadastrar'),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 37, 122, 40)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                  },
                  child: Text('Já tem conta? Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
