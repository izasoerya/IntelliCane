import 'package:flutter/material.dart';

class RegisterCaneID extends StatelessWidget {
  const RegisterCaneID({super.key});
  void submitCaneID() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 370,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.link,
                size: 30,
              ),
              Padding(padding: EdgeInsets.only(right: 5)),
              Text(
                'Konektivitas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Masukan ID Pengguna IntelliCane',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 170, 170, 170),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 68, 0, 255),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                  print('Submit button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(8), // Adjust padding
                  fixedSize: const Size(40, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust border radius
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 12), // Adjust text size
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
