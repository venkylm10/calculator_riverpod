class Utils {
  static bool isOperator(String buttonText, {bool hasEquals = false}) {
    final operators = [
      'AC',
      '+',
      '-',
      '/',
      'x',
      '.',
      '%',
      if (hasEquals) ...['=']
    ];

    return operators.contains(buttonText);
  }
}
