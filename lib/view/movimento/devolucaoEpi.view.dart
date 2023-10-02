import 'package:epi_seguranca/controller/movimentoEpi.controller.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/model/movimento.model.dart';
import 'package:epi_seguranca/util/constants/app.constants.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/textForm.utils.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
import 'package:flutter/material.dart';

class DevolucaoEpiView extends StatefulWidget {
  const DevolucaoEpiView({super.key});

  @override
  State<DevolucaoEpiView> createState() => _DevolucaoEpiViewState();
}

class _DevolucaoEpiViewState extends State<DevolucaoEpiView> {
  Epi _epi = Epi.initialValues();
  Funcionario _funcionario = Funcionario.initialValues();
  int _quantidade = 0;
  int _idTipoMovimento = CodigoMovimentoConstants.entradaDevolucao;
  Movimento _movimento = Movimento.initialValues();
  bool _descarte = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _epiController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _funcionarioController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _quantidadeController = TextEditingController.fromValue(const TextEditingValue(text:'0'));
  final TextEditingController _motivoController = TextEditingController.fromValue(TextEditingValue.empty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Logo(),
                const ScreenCard(
                  DevolveEpiConstants.devolucaoEpi,
                  icone: Icons.business,
                ),
      
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 3,
                        child: Text(
                          '${DevolveEpiConstants.funcionario}: ',
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
                          validator: (value) => TextFormUtils().defaultValidator(value, DevolveEpiConstants.funcionarioValidacao),
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
                      const Flexible(child: Text('${DevolveEpiConstants.nome}: ')),
                      Flexible(child: Text(_funcionario.nome)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Flexible(child: Text('${DevolveEpiConstants.departamento}: ')),
                      Flexible(child: Text(_funcionario.departamento)),
                    ],
                  ),
                ),
      
                Visibility(
                  visible: _funcionario.episAtribuidos != null,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 2,
                              child: Text(
                                '${DevolveEpiConstants.epiDevolvido}: ',
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
                                validator: (value) => TextFormUtils().defaultValidator(value, DevolveEpiConstants.epiDevolvidoValidacao),
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
                              '${DevolveEpiConstants.descricao}: ',
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
                            const Flexible(
                              flex: 3,
                              child: Text(
                                '${DevolveEpiConstants.quantidadeComFuncionario}: ',
                                // style: TextStyle(fontSize: 18),
                            )),
                            Flexible(
                              flex: 2,
                              child: Text(_epi.qtdFunc.toString())
                            ),
                          ],
                        ),
                      ),
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
                        child: Text('${DevolveEpiConstants.quantidadeDevolver}: ')
                      ),
                      // Flexible(
                      //   flex: 1,
                      //   child: Container()
                      // ),
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: Text(
                        DevolveEpiConstants.descarte,
                        // style: TextStyle(fontSize: 18),
                      )),
                      Flexible(
                        child: Switch.adaptive(
                          value: _descarte,
                          onChanged: _alteraDescarte,
                        )
                      ),
                    ],
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _motivoController,
                    decoration: const InputDecoration(
                      labelText: '${DevolveEpiConstants.motivo}: ',
                      border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid)),
                    ),
                    maxLines: 5,
                    validator: (value) => TextFormUtils().defaultValidator(value, DevolveEpiConstants.motivoValidacao),
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
      ),
    );
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

  Future<void> _selecionaEPI() async {
    final List<int> idsEpis = List.empty(growable: true);
                
    for (Epi epi in _funcionario.episAtribuidos!) {
      idsEpis.add(epi.id);
    }
    final resultado = await MovimentoEpiController.goToEpiSelecao(
      context, funcionario: _funcionario
    );
    if (resultado != null) {
      for (var epiFunc in _funcionario.episAtribuidos!) {
        if (epiFunc.id == resultado.id) {
          setState(() {
            _quantidade = epiFunc.qtdFunc;
          });
          break;
        }
      }

      setState(() {
        _epi = resultado;
      });
      _epiController.text = _epi.codigo;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  void _diminuiQuantidade() {
    if (_quantidade <= _epi.qtdFunc && _quantidade > 1) {
      _quantidade--;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  void _aumentaQuantidade() {
    if (_quantidade < _epi.qtdFunc && _quantidade >= 1) {
      _quantidade++;
      _quantidadeController.text = _quantidade.toString();
    }
  }

  void _alteraDescarte(bool value) {
    setState(() {
      _descarte = value;
    });
  }

  Future<void> _salvar() async {
    if(_descarte) {
      _idTipoMovimento = CodigoMovimentoConstants.entradaDescarte;
    }

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