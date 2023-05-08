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
        title: Text('Cadastro de usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey[100],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: Validatorless.required('Insira o nome'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _cpfController,
                maxLength: 11,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o CPF'),
                  Validatorless.number('Insira somente números'),
                  Validatorless.min(11, 'CPF inválido'),
                ]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o email'),
                  Validatorless.email('Insira um email válido'),
                ]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira a senha'),
                  Validatorless.min(
                      6, 'A senha precisa ter no mínimo 6 caracteres'),
                ]),
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLength: 11,
                controller: _telefoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Insira o telefone'),
                  Validatorless.number('Insira somente números'),
                  Validatorless.min(10, 'Telefone inválido'),
                ]),
              ),
              SizedBox(height: 32),
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
