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
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailEsqueceuSenhaController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Esqueceu a senha?'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Informe seu e-mail para recuperar a senha!'),
                Padding(padding: EdgeInsets.all(10.0)),
                TextFormField(
                  controller: _emailEsqueceuSenhaController,
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
              ],
            ),
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
                var formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  Navigator.of(context).pop();
                  _showSnackbar(
                      context, 'Um código foi enviado para seu e-mail!');
                }
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade600, Colors.blue.shade800],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    'Bem-vindo ao PRONTO SERVICE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Insira seus dados para entrar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      labelText: 'Email',
                      hintText: 'exemplo@dominio.com',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: Validatorless.multiple([
                      Validatorless.required('Insira o e-mail'),
                      Validatorless.email('Informe um e-mail válido'),
                    ]),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _senhaController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_versenha,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
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
                        icon: Icon(
                          _versenha
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
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
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                      }
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.CRIARCONTA);
                    },
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
