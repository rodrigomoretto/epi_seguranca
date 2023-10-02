import 'package:epi_seguranca/controller/funcionario.controller.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/textForm.utils.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
import 'package:flutter/material.dart';

class FuncionarioCrudView extends StatefulWidget {
  final Funcionario? funcionario;
  const FuncionarioCrudView({this.funcionario, super.key});

  @override
  State<FuncionarioCrudView> createState() => _FuncionarioCrudViewState();
}

class _FuncionarioCrudViewState extends State<FuncionarioCrudView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _departamentoController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _cargoController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _observacaoController = TextEditingController.fromValue(TextEditingValue.empty);

  @override
  Widget build(BuildContext context) {
    if (widget.funcionario != null) {
      _preencheFuncionarioEdicao();
    }
    return Scaffold(
      appBar: customAppBar,
      body: CustomView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Logo(),
              const ScreenCard(
                FuncionarioConstants.funcionariosCadastrados,
                icone: Icons.person
              ),
              Column(
                children: [
                  CustomTextForm(
                    controller: _nomeController,
                    texto: '${FuncionarioConstants.nome}:',
                    validador: (value) => TextFormUtils().defaultValidator(value, FuncionarioConstants.nomeValidacao),
                  ),
                  CustomTextForm(
                    controller: _departamentoController,
                    texto: '${FuncionarioConstants.departamento}:',
                    validador: (value) => TextFormUtils().defaultValidator(value, FuncionarioConstants.departamentoValidacao),
                  ),
                  CustomTextForm(
                    controller: _cargoController,
                    texto: '${FuncionarioConstants.cargo}:',
                    validador: (value) => TextFormUtils().defaultValidator(value, FuncionarioConstants.cargoValidacao),
                  ),
                  CustomTextForm(
                    controller: _observacaoController,
                    texto: '${FuncionarioConstants.observacao}:',
                  ),
                ],
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

  void _preencheFuncionarioEdicao() {
    _nomeController.text = widget.funcionario!.nome;
    _departamentoController.text = widget.funcionario!.departamento;
    _cargoController.text = widget.funcionario!.cargo;
    _observacaoController.text = widget.funcionario!.observacao ?? '';
  }

  Future<void> _salvar() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      if (widget.funcionario == null) {
        await FuncionarioController().createFuncionario(
          nome: _nomeController.text,
          departamento: _departamentoController.text,
          cargo: _cargoController.text,
          observacao: _observacaoController.text
        );
      } else {
        await FuncionarioController().updateFuncionario(
          id: widget.funcionario!.id,
          nome: _nomeController.text,
          departamento: _departamentoController.text,
          cargo: _cargoController.text,
          observacao: _observacaoController.text
        );
      }
      if (!context.mounted) return;
      Navigator.of(context).pop();
    }
  }
}
