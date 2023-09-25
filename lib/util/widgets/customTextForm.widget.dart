import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String? texto;
  final TextInputType? teclado;
  final bool? readOnly;
  final Function()? funcao;
  final String? Function(String?)? validador;
  const CustomTextForm({
    required this.controller, required this.texto, this.teclado, this.readOnly, this.funcao, this.validador, super.key
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.texto,
      ),
      keyboardType: widget.teclado ?? TextInputType.text,
      validator: widget.validador,
      readOnly: widget.readOnly ?? false,
      onTap: widget.funcao,
    );
  }
}