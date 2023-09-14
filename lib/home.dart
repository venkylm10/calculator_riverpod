import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/methods.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final methods = Methods();
    return Scaffold(
      backgroundColor: MyColors.background1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: methods.buildDisplay(),
          ),
          Expanded(
            flex: 2,
            child: methods.buildButtons(),
          ),
        ],
      ),
    );
  }
}
