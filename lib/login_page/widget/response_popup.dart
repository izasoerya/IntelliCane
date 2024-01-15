import 'package:flutter/material.dart';

void responseAuth(BuildContext context, String response, bool success) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the dialog after 5 seconds
        });

        return AlertDialog(
          title: Icon(
            success ? Icons.check_circle : Icons.error,
            color: success ? Colors.green : Colors.red,
            size: 40,
          ),
          content: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 2),
            child: Center(
              heightFactor: 1,
              widthFactor: 1,
              child: Text(response),
            ),
          ),
        );
      });
}
