class Movimento {
  final int? id;
  final int idFuncionario;
  final int idEpi;
  final int idTipoMov;
  final DateTime? dataMovimento;
  final int quantidade;
  final String? observacaoMotivo;

  Movimento({
    this.id,
    required this.idFuncionario,
    required this.idEpi,
    required this.idTipoMov,
    this.dataMovimento,
    required this.quantidade,
    this.observacaoMotivo,
  });

  factory Movimento.fromSqfliteDatabase(Map<String, dynamic> map) => Movimento(
    id: map['id']?.toInt() ?? 0,
    idFuncionario: map['id_funcionario']?.toInt() ?? 0,
    idEpi: map['id_epi']?.toInt() ?? 0,
    idTipoMov: map['id_tipoMov']?.toInt() ?? 0,
    dataMovimento: DateTime.parse(map['dataMovimento']),
    quantidade: map['quantidade']?.toInt() ?? 0,
    observacaoMotivo: map['obs_motivo'] ?? '',
  );

  factory Movimento.initialValues() => Movimento(
    id: 0,
    idFuncionario: 0,
    idEpi: 0,
    idTipoMov: 0,
    dataMovimento: DateTime.now(),
    quantidade: 0,
    observacaoMotivo: '',
  );

  factory Movimento.fromMovimento({
    required int idFuncMov,
    required int idEpiMov,
    required int idTipoMovMov,
    required int quantidadeMov,
    String? obsMotivo,
  }) => Movimento(
    idFuncionario: idFuncMov,
    idEpi: idEpiMov,
    idTipoMov: idTipoMovMov,
    quantidade: quantidadeMov,
    observacaoMotivo: obsMotivo,
  );
}



class TipoMovimento {
  // Tipo 0 -> Saída
  // Tipo 1 -> Entrada
  // Tipo 2 -> Descarte (Não há entrada)

  // Códigos:
  // 0: EI: Entrada por inclusão
  // 1: SA: Saída por atribuição
  // 2: ED: Entrada por devolução
  // 3: DE: Entrada para descarte

  final int id;
  final String codigo;
  final int tipo;
  final String descricao;

  TipoMovimento({
    required this.id,
    required this.codigo,
    required this.tipo,
    required this.descricao,
  });

  factory TipoMovimento.fromSqfliteDatabase(Map<String, dynamic> map) => TipoMovimento(
    id: map['id']?.toInt() ?? 0,
    codigo: map['codigo'] ?? '',
    tipo: map['tipo']?.toInt() ?? 0,
    descricao: map['descricao'] ?? '',
  );

  factory TipoMovimento.initialValues() => TipoMovimento(
    id: 0,
    codigo: '',
    tipo: 0,
    descricao: '',
  );
}