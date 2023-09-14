import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/button.dart';

class Methods {
  Widget buildDisplay() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(calculatorProvider);
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
                state.equation,
                overflow: state.equation.length > 100
                    ? TextOverflow.ellipsis
                    : TextOverflow.visible,
                style: TextStyle(
                  color: MyColors.numbers,
                  fontSize: state.equation.length < 20 ? 32 : 24,
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                state.result,
                overflow: state.equation.length > 30
                    ? TextOverflow.ellipsis
                    : TextOverflow.visible,
                style: TextStyle(
                  color: MyColors.numbers.withOpacity(0.7),
                  fontSize: 22,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildButtons() {
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
          buildRow("0", ".", "%", "="),
        ],
      ),
    );
  }

  Widget buildRow(String s, String t, String u, String v) {
    final row = [s, t, u, v];
    return Consumer(
      builder: (context, ref, child) {
        return Expanded(
          child: Row(
            children: row
                .map(
                  (text) => MyButton(
                    text: text,
                    onPressed: () => onButtonClicked(ref, text),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  void onButtonClicked(WidgetRef ref, String buttonText) {
    final calculator = ref.read(calculatorProvider.notifier);

    switch (buttonText) {
      case '=':
        calculator.equals();
        break;
      case '<':
        calculator.delete();
        break;
      case 'AC':
        calculator.reset();
        break;
      default:
        calculator.append(buttonText);
    }
  }
}
