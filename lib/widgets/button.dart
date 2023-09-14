import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/utils.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: Utils.isOperator(text) ? 24 : 22,
      color: Utils.isOperator(text) ? MyColors.operators : MyColors.numbers,
    );
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        height: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: MyColors.background2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: () {},
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
