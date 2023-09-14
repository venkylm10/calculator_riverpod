class Utils {
  static bool isOperator(String buttonText) {
    final operators = ['AC', '+', '-', '/', 'x', '%', '=', '.'];

    return operators.contains(buttonText);
  }

  static bool isOperatorAtEnd(String equation) {
    if (equation.isNotEmpty) {
      return isOperator(equation.substring(equation.length - 1));
    }
    return false;
  }
}
