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
          // String colorString = data[index]['color'];
          // String valueString = colorString.split("#")[1]; // remove the #
          // int value = int.parse(valueString, radix: 16);
          // Color color = new Color(value + 0xFF000000); // add the alpha value

          return Container(
            margin: EdgeInsets.only(top: 5),
            color: Colors.grey,
            child: Row(
              children: [
                const Icon(Icons.person, color: Colors.amberAccent),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
