class Epi {
  final int id;
  final String codigo;
  final String descricao;
  final int estoque;
  final DateTime dataValidade;
  final DateTime? cadastro;
  int qtdFunc;

  Epi({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.estoque,
    required this.dataValidade,
    this.cadastro,
    this.qtdFunc = 0,
  });

  factory Epi.fromSqfliteDatabase(Map<String, dynamic> map) => Epi(
    id: map['id']?.toInt() ?? 0,
    codigo: map['codigo'] ?? '',
    descricao: map['descricao'] ?? '',
    estoque: map['estoque']?.toInt() ?? 0,
    dataValidade: DateTime.parse(map['dataValidade']),
    cadastro: DateTime.parse(map['cadastro']),
  );

  factory Epi.initialValues() => Epi(
    id: 0,
    codigo: '',
    descricao: '',
    estoque: 0,
    dataValidade: DateTime.now(),
    cadastro: DateTime.now()
  );
}