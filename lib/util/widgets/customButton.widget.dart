import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final Function() funcao;
  final double height;
  const CustomButton({required this.texto, required this.funcao, this.height = 50, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: funcao,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            texto,
            style: const TextStyle(color: Colors.white,),
          ),
        ),
      ),
    );
  }
}