import 'package:epi_seguranca/controller/movimentoEpi.controller.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/model/movimento.model.dart';
import 'package:epi_seguranca/util/constants/app.constants.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/textForm.utils.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
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
      body: CustomView(
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
                        onTap: _selecionaEPI,
                        validator: (value) => TextFormUtils().defaultValidator(value, AtribuiEpiConstants.epiValidacao),
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
                      style: TextStyle(fontSize: 18),
                    )),
                    Flexible(child: Text(
                      _epi.descricao,
                      style: const TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        '${AtribuiEpiConstants.quantidadeEstoque}: ',
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        _epi.estoque.toString(),
                        style: const TextStyle(fontSize: 18),
                      )
                    ),
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
                        onTap: _selecionaFuncionario,
                        validator: (value) => TextFormUtils().defaultValidator(value, AtribuiEpiConstants.funcionarioValidacao),
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
                      '${AtribuiEpiConstants.nome}: ',
                      style: TextStyle(fontSize: 18),
                    )),
                    Flexible(child: Text(
                      _funcionario.nome,
                      style: const TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Flexible(child: Text(
                      '${AtribuiEpiConstants.departamento}: ',
                      style: TextStyle(fontSize: 18),
                    )),
                    Flexible(child: Text(
                      _funcionario.departamento,
                      style: const TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        '${AtribuiEpiConstants.quantidadeAtribuir}: ',
                        style: TextStyle(fontSize: 18),
                      )
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
                            onTap: _diminuiQuantidade,
                            child: const Icon(Icons.remove),
                          ),
                          suffixIcon: InkWell(
                            onTap: _aumentaQuantidade,
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
                funcao: _salvar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selecionaEPI() async {
    final resultado = await MovimentoEpiController.goToEpiSelecao(context);
    if (resultado != null) {
      setState(() {
        _epi = resultado;
        _quantidade = 1;
      });
      _epiController.text = _epi.codigo;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  Future<void> _selecionaFuncionario() async {
    final resultado = await MovimentoEpiController.goToFuncionarioSelecao(context);
    if (resultado != null) {
      setState(() {
        _funcionario = resultado;
      });
      _funcionarioController.text = _funcionario.id.toString();
    }
  }

  void _diminuiQuantidade() {
    if (_quantidade <= _epi.estoque && _quantidade > 1) {
      _quantidade--;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  void _aumentaQuantidade() {
    if (_quantidade < _epi.estoque && _quantidade >= 1) {
      _quantidade++;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  Future<void> _salvar() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      _movimento = Movimento.fromMovimento(
        idFuncMov: _funcionario.id,
        idEpiMov: _epi.id,
        idTipoMovMov: _idTipoMovimento,
        quantidadeMov: _quantidade,
      );
      await MovimentoEpiController().createMovimento(
        movimento: _movimento,
        epi: _epi
      );
      if (!context.mounted) return;
      Navigator.of(context).pop();
    }
  }
}