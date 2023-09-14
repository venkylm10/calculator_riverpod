import 'package:calculator_riverpod/models/calculator.dart';
import 'package:calculator_riverpod/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
        (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier() : super(Calculator());

  void append(String buttonText) {
    final equation = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.equation)) {
        final newequation =
            state.equation.substring(0, state.equation.length - 1);
        return newequation + buttonText;
      } else if (state.append) {
        return state.equation == '0' ? buttonText : state.equation + buttonText;
      } else {
        return Utils.isOperator(buttonText)
            ? state.equation + buttonText
            : buttonText;
      }
    }();

    state = state.copyWith(equation: equation, append: true);
    calculate();
  }

  void equals() {
    calculate();
    resetResult();
  }

  void resetResult() {
    final equation = state.result;
    state = state.copyWith(equation: equation, append: false);
  }

  void delete() {
    final equation = state.equation;
    if (equation.isNotEmpty) {
      final newEquation = equation.substring(0, equation.length - 1);
      if (newEquation.isEmpty) {
        reset();
      } else {
        state = state.copyWith(equation: newEquation);
        calculate();
      }
    }
  }

  void reset() {
    state = state.copyWith(equation: "0", result: "0", append: true);
  }

  void calculate() {
    final expression = state.equation.replaceAll('x', '*');
    try {
      final exp = Parser().parse(expression);
      final model = ContextModel();

      final result = '${exp.evaluate(EvaluationType.REAL, model)}';
      state = state.copyWith(result: result);
    } catch (e) {
      print(e.toString());
    }
  }
}
