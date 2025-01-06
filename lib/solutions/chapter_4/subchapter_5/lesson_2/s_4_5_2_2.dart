import 'package:flutter/material.dart';

class S4522 extends StatelessWidget {
  const S4522({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MyStatelessWidget();
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Hello Jessica'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Klick mich'),
        ),
      ],
    );
  }
}
