import 'package:flutter/material.dart';

class RegisterCaneID extends StatefulWidget {
  const RegisterCaneID({super.key});

  @override
  State<RegisterCaneID> createState() => _RegisterCaneIDState();
}

class _RegisterCaneIDState extends State<RegisterCaneID> {
  void submitCaneID() {}
  String caneID = '';

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
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() => caneID = value),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
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
                  submitCaneID();
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
