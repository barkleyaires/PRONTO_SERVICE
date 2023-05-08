import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //método de mensagem de confirmação
  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //método para esqueceu a senha
  void _mostrarPopupEsqueceuSenha(BuildContext context) {
    TextEditingController _emailEsqueceuSenhaController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Esqueceu a senha?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _emailEsqueceuSenhaController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implemente aqui o código para enviar o link de redefinição de senha
                Navigator.of(context).pop();
                _showSnackbar(context,
                    'Um código foi enviado para seu e-mail!');
              },
              child: Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _versenha = false;

  @override
  Widget build(BuildContext context) {
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
                  'Bem vindo ao PRONTO SERVICE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Insira seus dados para entrar',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                  obscureText: !_versenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _versenha = !_versenha;
                        });
                      },
                      icon: Icon(_versenha
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                  ),
                  validator: Validatorless.required('Insira a senha'),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _mostrarPopupEsqueceuSenha(context);
                      },
                      child: Text('Esqueceu a senha?'),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                    }
                  },
                  child: Text('Entrar'),
                ),
                const SizedBox(height: 15.0),
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
    );
  }
}
