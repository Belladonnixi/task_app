import 'package:flutter/material.dart';

int multiplyAdvanced(int a, int b) {
  int result = 0;
  bool isNegative = false;
  // If one of the numbers is negative, then the result is also negative.
  if (a < 0) {
    isNegative = !isNegative;
    a = -a;
  }
  if (b < 0) {
    isNegative = !isNegative;
    b = -b;
  }

  // Multiplication is performed using a loop and addition
  for (int i = 0; i < b; i++) {
    result += a;
  }
  return isNegative ? -result : result;
}

class S3388 extends StatefulWidget {
  const S3388({Key? key}) : super(key: key);

  @override
  State<S3388> createState() => _S3388State();
}

class _S3388State extends State<S3388> {
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  String? output;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _input1Controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Zahl 1',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _input2Controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Zahl 2',
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          output?.toString() ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            final input1 = int.tryParse(_input1Controller.text);
            final input2 = int.tryParse(_input2Controller.text);
            if (input1 == null || input2 == null) {
              setState(() {
                output = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bitte 2 Zahlen eingeben.'),
                ),
              );
              return;
            }
            setState(() {
              output = multiplyAdvanced(input1, input2).toString();
            });
          },
          child: const Text('Multipliziere'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _input1Controller.dispose();
    super.dispose();
  }
}
