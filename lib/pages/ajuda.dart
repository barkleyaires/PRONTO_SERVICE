import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  const Ajuda({super.key});

  @override
  Widget build(BuildContext context) {
    //método de mensagem de confirmação
    void _showSnackbar(BuildContext context, String message) {
      final snackBar = SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    String dropdownValue = 'Categoria 1';
    final TextEditingController _nomeController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _mensagemController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Envie sua mensagem para receber suporte',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {},
                items: <String>['Categoria 1', 'Categoria 2', 'Categoria 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _mensagemController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Mensagem',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                   Navigator.of(context).pop();
                  _showSnackbar(
                      context, 'Sua mensagem foi enviada com sucesso!');
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
