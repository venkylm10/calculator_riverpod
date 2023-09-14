import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/utils.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: Utils.isOperator(text) ? 26 : 24,
      color: Utils.isOperator(text) ? MyColors.operators : MyColors.numbers,
      fontWeight: FontWeight.bold,
    );
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        height: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:
                text == '' ? Colors.transparent : MyColors.background1,
            shape: CircleBorder(),
          ),
          onPressed: onPressed,
          child: text == '<'
              ? const Icon(
                  Icons.backspace_outlined,
                  color: MyColors.operators,
                )
              : Text(
                  text,
                  style: style,
                ),
        ),
      ),
    );
  }
}
