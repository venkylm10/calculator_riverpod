import 'package:calculator_riverpod/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/button.dart';

class Methods {
  static Widget buildDisplay(String expression, String result) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 10,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expression,
            style: const TextStyle(
              color: MyColors.numbers,
              fontSize: 28,
            ),
          ),
          Text(
            result,
            style: TextStyle(
              color: MyColors.numbers.withOpacity(0.7),
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        color: MyColors.background3,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          buildRow("AC", "<", "", "/"),
          buildRow("7", "8", "9", "x"),
          buildRow("4", "5", "6", "-"),
          buildRow("1", "2", "3", "+"),
          buildRow("0", ".", "%", "/"),
        ],
      ),
    );
  }

  static Widget buildRow(String s, String t, String u, String v) {
    final row = [s, t, u, v];
    return Expanded(
      child: Row(
        children: row
            .map(
              (text) => MyButton(text: text),
            )
            .toList(),
      ),
    );
  }
}
