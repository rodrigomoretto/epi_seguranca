import 'package:epi_seguranca/model/epi.model.dart';

class Funcionario {
  final int id;
  final String nome;
  final String departamento;
  final String cargo;
  final String? observacao;
  final DateTime? cadastro;
  List<Epi>? episAtribuidos;

  Funcionario({
    required this.id,
    required this.nome,
    required this.departamento,
    required this.cargo,
    this.observacao,
    this.cadastro,
    this.episAtribuidos,
  });

  factory Funcionario.fromSqfliteDatabase(Map<String, dynamic> map, {List<Epi>? epis}) => Funcionario(
    id: map['id']?.toInt() ?? 0,
    nome: map['nome'] ?? '',
    departamento: map['departamento'] ?? '',
    cargo: map['cargo'] ?? '',
    observacao: map['observacao'] ?? '',
    cadastro: DateTime.parse(map['cadastro']),
    episAtribuidos: epis
  );

  factory Funcionario.initialValues() => Funcionario(
    id: 0,
    nome: '',
    departamento: '',
    cargo: '',
    observacao: '',
    cadastro: DateTime.now(),
  );
}