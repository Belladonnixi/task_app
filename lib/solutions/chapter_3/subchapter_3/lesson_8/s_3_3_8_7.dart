import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

/// This functions tries to hack a 4 digit PIN.
/// It returns the PIN as a string.
String hackPin() {
  // Iterate through all possible 4-digit PIN combinations (from 0000 to 9999)
  for (int i = 0; i <= 9999; i++) {
    // Convert the number to a string and pad it with zeros to have 4 digits
    String pin = i.toString().padLeft(4, '0');

    // Then, in each iteration, check if the PIN is correct
    if (_isPinCorrect(pin)) {
      return pin;
    }
  }
  // If no PIN was found, an exception is thrown, which should actually never happen
  // but we need it to compile the code and prevent a null return
  throw Exception("Keine gültige PIN gefunden!");
}

bool _isPinCorrect(String input) {
  final hashedInput = sha1.convert(utf8.encode(input)).toString();
  return hashedInput == _secretPinHashed;
}

const String _secretPinHashed = '2a0ebfb7c7ecc618493f4f6dfae77d2bccddc7ba';

class S3387 extends StatefulWidget {
  const S3387({Key? key}) : super(key: key);

  @override
  State<S3387> createState() => _S3387State();
}

class _S3387State extends State<S3387> {
  String? output;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          output?.toString() ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              output = "Die PIN lautet: ${hackPin()}.";
            });
          },
          child: const Text('Hacke PIN'),
        ),
      ],
    );
  }
}
