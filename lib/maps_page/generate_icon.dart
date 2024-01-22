import 'package:flutter/material.dart';
import 'package:intellicane/database/monitoring_db.dart';

List<Map<String, dynamic>> data = []; // This will hold your IDs
Future<List> fetchIds() async {
  return (await retrieveDataAll());
}

class GeneratorIcon extends StatefulWidget {
  const GeneratorIcon({super.key});

  @override
  State<GeneratorIcon> createState() => _GeneratorIconState();
}

class _GeneratorIconState extends State<GeneratorIcon> {
  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Text(
            "No data, please add a patient first",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          )
        : SizedBox(
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
                  width: 370,
                  margin: const EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      Icon(Icons.map, color: color),
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
