import 'package:flutter/material.dart';

class GeneratorIcon extends StatefulWidget {
  const GeneratorIcon({super.key});

  @override
  State<GeneratorIcon> createState() => _GeneratorIconState();
}

class _GeneratorIconState extends State<GeneratorIcon> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.location_on,
          color: Color.fromARGB(255, 12, 0, 139),
          size: 30,
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        SizedBox(
          width: 100,
          child: Text("Intellicane - 1"),
        ),
      ],
    );
  }
}
