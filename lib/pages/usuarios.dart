import 'package:flutter/material.dart';
import 'package:pronto_service/pages/resultPage.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class Usuarios extends StatelessWidget {
  const Usuarios({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nomeController = TextEditingController();
    final _cpfController = TextEditingController();
    final _emailController = TextEditingController();
    final _senhaController = TextEditingController();
    final _telefoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuario'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomeController,
                //    keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Nome: ', prefixIcon: Icon(Icons.person)),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o nome'),
                ]),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _cpfController,
                maxLength: 11,
                // keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Cpf: ', prefixIcon: Icon(Icons.abc)),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o cpf'),
                  Validatorless.number('Insira somente números'),
                  Validatorless.min(11, 'Cpf inválido')
                ]),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email: ',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: Validatorless.multiple(
                    [Validatorless.email('Insira um email válido')]),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                    labelText: 'Senha: ', prefixIcon: Icon(Icons.lock)),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira a senha'),
                  Validatorless.min(
                      6, 'A senha precisa ter no mínimo 6 caracteres')
                ]),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                maxLength: 11,
                controller: _telefoneController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Telefone: ', prefixIcon: Icon(Icons.phone)),
                validator: Validatorless.multiple(
                    [Validatorless.number('Insira um telefone válido')]),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  String nome = _nomeController.text;
                  String cpf = _cpfController.text;
                  String email = _emailController.text;
                  String senha = _senhaController.text;
                  String telefone = _telefoneController.text;

                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              resultPage(nome, cpf, email, senha, telefone)),
                    );
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
