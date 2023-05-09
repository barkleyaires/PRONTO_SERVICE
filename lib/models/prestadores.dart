import 'telefone.dart';

class Prestadores {
  final String id;
  final String nome;
  final String email;
  Telefone telefone;
  final String imageUrl;

  // Construtor
  Prestadores(
    this.telefone, {
    required this.id,
    required this.nome,
    required this.email,
    required this.imageUrl,
  });
}
