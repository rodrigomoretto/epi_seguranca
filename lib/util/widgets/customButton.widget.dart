import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String texto;
  final Function() funcao;
  const CustomButton({required this.texto, required this.funcao, super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: widget.funcao,
        child: Text(
          widget.texto,
          style: const TextStyle(color: Colors.white,
        ),
        )
      ),
    );
  }
}