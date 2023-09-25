class Usuario {
  final int id;
  final String nome;
  final String username;
  final String senha;
  final DateTime? cadastro;

  Usuario({
    required this.id,
    required this.nome,
    required this.username,
    required this.senha,
    this.cadastro
  });

  factory Usuario.fromSqfliteDatabase(Map<String, dynamic> map) => Usuario(
    id: map['id']?.toInt() ?? 0,
    nome: map['nome'] ?? '',
    username: map['username'] ?? '',
    senha: map['senha'] ?? 0,
    cadastro: DateTime.parse(map['cadastro']),
  );
}