import 'package:flutter/material.dart';

class S4531 extends StatelessWidget {
  const S4531({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ColorfulContainers();
  }
}

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      color: color,
      height: 100,
      width: 100,
    );
  }
}

class ColorfulContainers extends StatelessWidget {
  const ColorfulContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColoredContainer(color: Colors.blueGrey),
        ColoredContainer(color: Colors.blue),
        ColoredContainer(color: Colors.cyan),
      ],
    );
  }
}
