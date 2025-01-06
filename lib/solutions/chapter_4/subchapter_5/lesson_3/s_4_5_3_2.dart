import 'package:flutter/material.dart';

class S4532 extends StatelessWidget {
  const S4532({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TextStyles();
  }
}

class TextStyles extends StatelessWidget {
  const TextStyles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('App Akademie'),
        SizedBox(height: 20),
        Text(
          'App Akademie',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'App Akademie',
          style: TextStyle(
            fontSize: 10,
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
