class Funcionario {
  final int id;
  final String nome;
  final String departamento;
  final String cargo;
  final String? observacao;
  final DateTime? cadastro;

  Funcionario({
    required this.id,
    required this.nome,
    required this.departamento,
    required this.cargo,
    this.observacao,
    this.cadastro
  });

  factory Funcionario.fromSqfliteDatabase(Map<String, dynamic> map) => Funcionario(
    id: map['id']?.toInt() ?? 0,
    nome: map['nome'] ?? '',
    departamento: map['departamento'] ?? '',
    cargo: map['cargo'] ?? '',
    observacao: map['observacao'] ?? '',
    cadastro: DateTime.parse(map['cadastro']),
  );
}