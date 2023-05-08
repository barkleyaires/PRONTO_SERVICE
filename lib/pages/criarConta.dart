import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:validatorless/validatorless.dart';

import '../utils/app_routes.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nomeController = TextEditingController();
    final _emailController = TextEditingController();
    final _senhaController = TextEditingController();
    final _confirmSenhaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CRIAR CONTA')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.LOGIN);
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              Text(
                'Cadastre-se',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira seu nome'),
                  Validatorless.min(2, 'Mínimo de 2 caracteres')
                ]),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o e-mail'),
                  Validatorless.email('Informe um e-mail válido')
                ]),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _senhaController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira a senha'),
                  Validatorless.min(6, 'Mínimo 6 caracteres'),
                ]),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmSenhaController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirme a senha'),
                  Validatorless.compare(
                      _senhaController, 'As senhas precisam ser iguais')
                ]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Salvar', style: TextStyle(fontSize: 20)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
