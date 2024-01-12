import 'package:flutter/material.dart';

class ConnectedCane extends StatefulWidget {
  const ConnectedCane({super.key});

  @override
  State<ConnectedCane> createState() => _ConnectedCaneState();
}

class _ConnectedCaneState extends State<ConnectedCane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.people),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  "Tunanetra yang terhubung"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(top: 20),
            child: const Image(
              image: AssetImage('assets/vector-tunanetra.png'),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 25)),
          const Text(
              style: TextStyle(
                fontSize: 16,
              ),
              "Anda belum terhubung ke orang tunanetra"),
        ],
      ),
    );
  }
}
