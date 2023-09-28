import 'package:epi_seguranca/controller/movimento/atribuicaoEpi.controller.dart';
import 'package:epi_seguranca/controller/movimento/movimentoEpi.controller.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/model/movimento.model.dart';
import 'package:epi_seguranca/util/constants/app.constants.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class AtribuicaoEpiView extends StatefulWidget {
  const AtribuicaoEpiView({super.key});

  @override
  State<AtribuicaoEpiView> createState() => _AtribuicaoEpiViewState();
}

class _AtribuicaoEpiViewState extends State<AtribuicaoEpiView> {
  Epi _epi = Epi.initialValues();
  Funcionario _funcionario = Funcionario.initialValues();
  int _quantidade = 0;
  final int _idTipoMovimento = CodigoMovimentoConstants.saidaAtribuicao;
  Movimento _movimento = Movimento.initialValues();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _epiController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _funcionarioController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _quantidadeController = TextEditingController.fromValue(const TextEditingValue(text:'0'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const Logo(),
              const ScreenCard(
                AtribuiEpiConstants.atribuirEpi,
                icone: Icons.business,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 2,
                      child: Text(
                        '${AtribuiEpiConstants.codigoEpi}: ',
                        style: TextStyle(
                          fontSize: 24
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        controller: _epiController,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                        ),
                        onTap: () async {
                          final resultado = await MovimentoEpiController.goToEpiSelecao(context);
                          if (resultado != null) {
                            setState(() {
                              _epi = resultado;
                              _quantidade = 1;
                            });
                            _epiController.text = _epi.codigo;
                            _quantidadeController.text = _quantidade.toString();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(child: Text(
                      '${AtribuiEpiConstants.descricao}: ',
                      // style: TextStyle(fontSize: 18),
                    )),
                    Flexible(child: Text(_epi.descricao)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(child: Text('${AtribuiEpiConstants.quantidadeEstoque}: ')),
                    Flexible(child: Text(_epi.estoque.toString())),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        '${AtribuiEpiConstants.funcionario}: ',
                        style: TextStyle(
                          fontSize: 24
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: TextFormField(
                        controller: _funcionarioController,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                        ),
                        onTap: () async {
                          final resultado = await MovimentoEpiController.goToFuncionarioSelecao(context);
                          if (resultado != null) {
                            setState(() {
                              _funcionario = resultado;
                            });
                            _funcionarioController.text = _funcionario.id.toString();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(child: Text('${AtribuiEpiConstants.nome}: ')),
                    Flexible(child: Text(_funcionario.nome)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(child: Text('${AtribuiEpiConstants.departamento}: ')),
                    Flexible(child: Text(_funcionario.departamento)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 2,
                      child: Text('${AtribuiEpiConstants.quantidadeAtribuir}: ')
                    ),
                    Flexible(
                      flex: 1,
                      child: Container()
                    ),
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _quantidadeController,
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {
                              if (_quantidade <= _epi.estoque && _quantidade > 1) {
                                _quantidade--;
                                _quantidadeController.text = _quantidade.toString();
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              if (_quantidade < _epi.estoque && _quantidade >= 1) {
                                _quantidade++;
                                _quantidadeController.text = _quantidade.toString();
                              }
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              CustomButton(
                texto: ApplicationConstants.incluir,
                funcao: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    _movimento = Movimento.fromMovimento(
                      idFuncMov: _funcionario.id,
                      idEpiMov: _epi.id,
                      idTipoMovMov: _idTipoMovimento,
                      quantidadeMov: _quantidade
                    );
                    await AtribuicaoController().createMovimento(
                      movimento: _movimento,
                      epi: _epi
                    );
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenCard extends StatelessWidget {
  final String texto;
  final IconData icone;
  const ScreenCard(this.texto, {required this.icone, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          texto,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          icone,
          size: 50,
        ),
      ],
    );
  }
}