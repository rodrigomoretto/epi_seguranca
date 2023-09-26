class Usuario {
  final int id;
  final String nome;
  final String username;
  final String senha;

  Usuario({
    required this.id,
    required this.nome,
    required this.username,
    required this.senha,
  });

  factory Usuario.fromSqfliteDatabase(Map<String, dynamic> map) => Usuario(
    id: map['id']?.toInt() ?? 0,
    nome: map['nome'] ?? '',
    username: map['username'] ?? '',
    senha: map['senha'] ?? 0,
  );
}