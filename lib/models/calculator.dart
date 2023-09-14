class Calculator {
  final bool append;
  final String equation;
  final String result;
  Calculator({
    this.append = true,
    this.equation = "0",
    this.result = "0",
  });

  Calculator copyWith({
    bool? append,
    String? equation,
    String? result,
  }) {
    return Calculator(
      append: append ?? this.append,
      equation: equation ?? this.equation,
      result: result ?? this.result,
    );
  }
}
