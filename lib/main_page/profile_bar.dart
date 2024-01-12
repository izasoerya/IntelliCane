import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: EdgeInsets.only(right: 20),
      height: 60,
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 223, 223, 223),
        borderRadius: BorderRadius.circular(10), // specify the radius
      ),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 244, 244),
            borderRadius: BorderRadius.circular(40), // specify the radius
          ),
          child: const Icon(Icons.person),
        ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Admin',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications),
      ]),
    );
  }
}
