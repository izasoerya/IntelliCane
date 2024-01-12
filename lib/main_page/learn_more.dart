import 'package:flutter/material.dart';

class LearnMoreBar extends StatelessWidget {
  const LearnMoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 170,
      width: 370,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 110, 160, 255),
            Color.fromARGB(255, 126, 171, 255),
          ])),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(padding: EdgeInsets.only(left: 20)),
        Flexible(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                'Pelajari lebih lanjut',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                'Pelajari lebih lanjut tentang IntelliCane',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  'Pelajari',
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/intellicane-logo.png',
          height: 150,
          width: 150,
        ),
      ]),
    );
  }
}
