import 'package:flutter/material.dart';

int countPatient = 0;

void generateNewUser(
  String patientId,
  String patientName,
) {
  ProfilePatient newUser = ProfilePatient(id: patientId, name: patientName);
  dataPatientRegistered.add(newUser);
}

List<ProfilePatient> dataPatientRegistered = [];

class ProfilePatient {
  final String id;
  final String name;
  final Color color;

  ProfilePatient({required this.id, required this.name})
      : color = _generateColor();

  static Color _generateColor() {
    // Generate a random color
    if (countPatient == 0) {
      countPatient++;
      return Colors.blue;
    } else if (countPatient == 1) {
      countPatient++;
      return Colors.red;
    } else if (countPatient == 2) {
      countPatient++;
      return Colors.green;
    } else if (countPatient == 3) {
      countPatient++;
      return Colors.yellow;
    } else if (countPatient == 4) {
      countPatient++;
      return Colors.purple;
    } else if (countPatient == 5) {
      countPatient++;
      return Colors.orange;
    } else if (countPatient == 6) {
      countPatient++;
      return Colors.pink;
    } else if (countPatient == 7) {
      countPatient++;
      return Colors.teal;
    } else if (countPatient == 8) {
      countPatient++;
      return Colors.cyan;
    } else if (countPatient == 9) {
      countPatient++;
      return Colors.brown;
    } else if (countPatient == 10) {
      countPatient++;
      return Colors.grey;
    } else {
      countPatient = 0;
      return Colors.blue;
    }
  }
}
