import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

/// This functions tries to hack a 4 digit PIN.
/// It returns the PIN as a string.
String hackPin() {
  // bei einer 4stelligen pin gibt es 10000 mögliche kombinationen deshalb wird von 0 bis 9999 durchgegangen
  for (int i = 0; i <= 9999; i++) {
    // hier wird die Zahl in einen String umgewandelt
    //und mit padLeft auf 4 Stellen aufgefüllt bei jedem Durchgang wird die Zahl um 1 erhöht
    String pin = i.toString().padLeft(4, '0');

    // dann wird bei jeem Durchgang geprüft ob die Pin korrekt ist
    if (_isPinCorrect(pin)) {
      return pin;
    }
  }
  // Falls kein PIN gefunden wurde, wird eine Exception geworfen, sollte tatsächlich aber niemals passieren
  // brauchen wir aber um den Code zu kompilieren und eben eine null Rückgabe zu verhindern
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
