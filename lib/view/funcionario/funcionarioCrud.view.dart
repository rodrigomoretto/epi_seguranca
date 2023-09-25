import 'package:epi_seguranca/controller/funcionario.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class FuncionarioCrudView extends StatefulWidget {
  const FuncionarioCrudView({super.key});

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
    return Scaffold(
      appBar: customAppBar,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Logo(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    CustomTextForm(
                      controller: _nomeController,
                      texto: '${FuncionarioConstants.nome}:',
                      validador: (value) => value != null && value.isEmpty
                          ? FuncionarioConstants.nomeValidacao
                          : null,
                    ),
                    CustomTextForm(
                      controller: _departamentoController,
                      texto: '${FuncionarioConstants.departamento}:',
                      validador: (value) => value != null && value.isEmpty
                          ? FuncionarioConstants.departamentoValidacao
                          : null,
                    ),
                    CustomTextForm(
                      controller: _cargoController,
                      texto: '${FuncionarioConstants.cargo}:',
                      validador: (value) => value != null && value.isEmpty
                          ? FuncionarioConstants.cargoValidacao
                          : null,
                    ),
                    CustomTextForm(
                      controller: _observacaoController,
                      texto: '${FuncionarioConstants.observacao}:',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        await FuncionarioController().createFuncionario(
                            nome: _nomeController.text,
                            departamento: _departamentoController.text,
                            cargo: _cargoController.text,
                            observacao: _observacaoController.text);
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      ApplicationConstants.incluir,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
