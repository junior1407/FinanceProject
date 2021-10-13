import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String message;

  const TestPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TEST PAGE");
    return Container(
      color: Colors.black26,
      height: 200,
      width: 200,

    );
  }
}
