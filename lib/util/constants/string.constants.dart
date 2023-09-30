class ApplicationConstants {
  static const String appName = 'Segurança do Trabalho';
  static const String bemVindo = 'Bem Vindo';
  static const String incluir = 'Incluir';
  static const String aviso = 'Aviso!';
  static const String ok = 'OK';
  static const String sim = 'Sim';
  static const String nao = 'Não';
  static const String trocarUsuario = 'Deseja trocar de usuário?';
}

class LoginConstants {
  static const String nomeUsuario = 'Nome de Usuário';
  static const String nomeUsuarioValidacao = 'Digite o nome de Usuário';
  static const String senha = 'Senha';
  static const String senhaValidacao = 'Digite a Senha';
  static const String login = 'Login';
  static const String usuarioSenhaInvalido = 'Usuário ou Senha inválidos';
}

class HomeConstants {
  static const String funcionario = 'Funcionário';
  static const String epi = 'EPI';
  static const String atribuirEpi = 'Atribuir EPI';
  static const String relatorios = 'Relatórios';
  static const String bemVindo = 'Bem Vindo';
}

class FuncionarioConstants {
  static const String funcionario = 'Funcionário';
  static const String funcionariosCadastrados = 'Funcionários Cadastrados';
  static const String nome = 'Nome';
  static const String nomeValidacao = 'Digite o nome do funcionário';
  static const String departamento = 'Departamento';
  static const String departamentoValidacao = 'Digite o nome do departamento';
  static const String cargo = 'Cargo';
  static const String cargoValidacao = 'Digite o nome do cargo';
  static const String observacao = 'Observação';
  static const String cadastro = 'Cadastrado em';
  static const String semFuncionarios = 'Sem Funcionários cadastrados';
  static const String episAtribuidos = 'EPIs atribuídos';
  static const String semEpisAtribuidos = 'Sem EPIs atribuídos';
}

class EpiConstants {
  static const String epi = 'EPI';
  static const String episCadastrados = 'EPIs Cadastrados';
  static const String descricao = 'Descrição';
  static const String descricaoValidacao = 'Digite a descrição do EPI';
  static const String codigo = 'Código';
  static const String codigoValidacao = 'Digite o código do EPI';
  static const String quantidade = 'Quantidade';
  static const String estoque = 'Estoque';
  static const String estoqueValidacao = 'Digite a quantidade em estoque do EPI';
  static const String dataValidade = 'Data de validade';
  static const String dataValidadeValidacao = 'Informe a data de validade do EPI';
  static const String cadastro = 'Cadastrado em';
  static const String semEpis = 'Sem EPIs cadastrados';
}

class MovimentoEpiConstants {
  static const String atribuicaoEpi = 'Atribuição de EPI';
  static const String atribuirEpi = 'Atribuir EPI';
  static const String devolucaoEpi = 'Devolução EPI';
}

class AtribuiEpiConstants {
  static const String atribuirEpi = 'Atribuir EPI';
  static const String codigoEpi = 'Código EPI';
  static const String descricao = 'Descrição';
  static const String quantidadeEstoque = 'Quantidade em estoque';
  static const String funcionario = 'Funcionário';
  static const String nome = 'Nome';
  static const String departamento = 'Departamento';
  static const String quantidadeAtribuir = 'Quantidade a atribuir';
}

class DevolveEpiConstants {
  static const String devolucaoEpi = 'Devolução EPI';
  static const String funcionario = 'Funcionário';
  static const String nome = 'Nome';
  static const String departamento = 'Departamento';
  static const String epiDevolvido = 'EPI Devolvido';
  static const String descricao = 'Descrição';
  static const String quantidadeDevolver = 'Quantidade a devolver';
  static const String quantidadeComFuncionario = 'Quantidade com Funcionário';
  static const String descarte = 'Descarte?';
  static const String motivo = 'Motivo';
}

class RelatorioConstants {
  static const String relatorios = 'Relatórios';
  static const String funcionariosCadastrados = 'Funcionários Cadastrados';
  static const String episCadastrados = 'EPIs Cadastrados';
}