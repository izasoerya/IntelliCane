import 'package:flutter/material.dart';

class PatientBar extends StatelessWidget {
  const PatientBar({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 370,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          String name = data[index]['name'];
          String id = data[index]['id'];
          String colorString = data[index]['color'];
          final colorValueString = colorString
              .split('(0x')[1]
              .split(')')[0]; // Extract color value from string
          final colorValue = int.parse(colorValueString,
              radix: 16); // Convert color value to integer
          final color = Color(colorValue); // Create color object

          return Container(
            alignment: Alignment.topLeft,
            height: 50,
            margin: const EdgeInsets.only(top: 7),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 228, 228),
              borderRadius:
                  BorderRadius.circular(10), // Set the border radius here
            ),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.only(right: 10)),
                Icon(Icons.person, color: color),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 5)),
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(id),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
