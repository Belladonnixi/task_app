import 'package:flutter/material.dart';

bool isAnagram(String word1, String word2) {
  // Strings normalisieren: Leerzeichen entfernen und in Kleinbuchstaben umwandeln
  String normalizedWord1 = word1.replaceAll(' ', '').toLowerCase();
  String normalizedWord2 = word2.replaceAll(' ', '').toLowerCase();

  // Wenn die Längen nicht gleich sind, können sie keine Anagramme sein
  if (normalizedWord1.length != normalizedWord2.length) {
    return false;
  }

  // Strings in Listen von Buchstaben umwandeln und sortieren
  List<String> sortedWord1 = normalizedWord1.split('')..sort();
  List<String> sortedWord2 = normalizedWord2.split('')..sort();

  // Vergleiche die sortierten Listen ob sie gleich sind dann haben wir ein Anagram
  return sortedWord1.join() == sortedWord2.join();
}

class S3386 extends StatefulWidget {
  const S3386({Key? key}) : super(key: key);

  @override
  State<S3386> createState() => _S3386State();
}

class _S3386State extends State<S3386> {
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
            labelText: 'Wort 1',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _input2Controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Wort 2',
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
            final input1 = _input1Controller.text;
            final input2 = _input2Controller.text;
            setState(() {
              output = isAnagram(input1, input2) ? 'Anagram' : 'Kein Anagram';
            });
          },
          child: const Text('Prüfe Anagram'),
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
