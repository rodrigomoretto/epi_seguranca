import 'package:epi_seguranca/controller/epi.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EpiCrudView extends StatefulWidget {
  const EpiCrudView({super.key});

  @override
  State<EpiCrudView> createState() => _EpiCrudViewState();
}

class _EpiCrudViewState extends State<EpiCrudView> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _codigoController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _descricaoController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _estoqueController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _dataValidadeController = TextEditingController.fromValue(TextEditingValue.empty);

  DateTime _dataValidade = DateTime.now().add(const Duration(days: 1));

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
            children: <Widget> [
              const Logo(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    CustomTextForm(
                      controller: _codigoController,
                      texto: '${EpiConstants.codigo}:',
                      validador: (value) =>
                        value != null && value.isEmpty ? EpiConstants.codigoValidacao : null,
                    ),
                    CustomTextForm(
                      controller: _descricaoController,
                      texto: '${EpiConstants.descricao}:',
                      validador: (value) =>
                        value != null && value.isEmpty ? EpiConstants.descricaoValidacao : null,
                    ),
                    CustomTextForm(
                      controller: _estoqueController,
                      texto: '${EpiConstants.estoque}:',
                      teclado: TextInputType.number,
                      validador: (value) =>
                        value != null && value.isEmpty ? EpiConstants.estoqueValidacao : null,
                    ),
                    CustomTextForm(
                      controller: _dataValidadeController,
                      texto: '${EpiConstants.dataValidade}:',
                      readOnly: true,
                      funcao: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: _dataValidade,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          _dataValidade = date;
                          _dataValidadeController.text = DateFormat.yMd().format(_dataValidade);
                        }
                      },
                      validador: (value) =>
                        value != null && value.isEmpty ? EpiConstants.dataValidadeValidacao : null,
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
                      await EpiController().createEpi(
                        codigo: _codigoController.text,
                        descricao: _descricaoController.text,
                        estoque: int.parse(_estoqueController.text),
                        dataValidade: _dataValidade,
                      );
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    ApplicationConstants.incluir,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}