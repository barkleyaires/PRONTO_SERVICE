import 'package:flutter/widgets.dart';
import 'telefone.dart';

class Usuario {
  final String id;
  final String nome;
  final String email;
  final String imageUrl;

  // Construtor
  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.imageUrl,
  });
}
