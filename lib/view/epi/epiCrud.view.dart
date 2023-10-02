import 'package:epi_seguranca/controller/epi.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/textForm.utils.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
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
      // Adjust Paddings
      body: CustomView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              const Logo(),
              const ScreenCard(
                EpiConstants.episCadastrados,
                icone: Icons.business_center_outlined,
              ),
              Column(
                children: [
                  CustomTextForm(
                    controller: _codigoController,
                    texto: '${EpiConstants.codigo}:',
                    validador: (value) => TextFormUtils().defaultValidator(value, EpiConstants.codigoValidacao),
                  ),
                  CustomTextForm(
                    controller: _descricaoController,
                    texto: '${EpiConstants.descricao}:',
                    validador: (value) => TextFormUtils().defaultValidator(value, EpiConstants.descricaoValidacao),
                  ),
                  CustomTextForm(
                    controller: _estoqueController,
                    texto: '${EpiConstants.estoque}:',
                    teclado: TextInputType.number,
                    validador: (value) => TextFormUtils().defaultValidator(value, EpiConstants.estoqueValidacao),
                  ),
                  CustomTextForm(
                    controller: _dataValidadeController,
                    texto: '${EpiConstants.dataValidade}:',
                    readOnly: true,
                    funcao: _selecionaDataValidade,
                    validador: (value) => TextFormUtils().defaultValidator(value, EpiConstants.dataValidadeValidacao),
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

  Future<void> _selecionaDataValidade() async {
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
  }

  Future<void> _salvar() async {
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
  }
}