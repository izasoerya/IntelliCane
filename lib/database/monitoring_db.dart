import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int countPatient = 0;

void generateNewUser(
  String patientId,
  String patientName,
) {
  ProfilePatient newUser = ProfilePatient(id: patientId, name: patientName);
  newUser.submitToFirebaseDatabase(newUser);
}

List<ProfilePatient> dataPatientRegistered = [];
List<ProfilePatient> getPatientRegistered() {
  return dataPatientRegistered;
}

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

  void submitToFirebaseDatabase(ProfilePatient patient) async {
    var db = FirebaseFirestore.instance;
    final user = <String, dynamic>{
      "name": patient.name,
      "id": patient.id,
      "color": patient.color.toString(),
    };
    db.collection("patient").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

    await retrieveData(patient.name);
  }

  Future<void> retrieveData(String userId) async {
    var db = FirebaseFirestore.instance;

    await db.collection("patient").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
}
