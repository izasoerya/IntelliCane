import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int countPatient = 0;

void generateNewUser(
  String patientId,
  String patientName,
) {
  ProfilePatient newUser = ProfilePatient(id: patientId, name: patientName);
  submitToFirebaseDatabase(newUser);
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

  await retrieveDataSnapshot();
}

Future<Map<String, dynamic>> retrieveDataSnapshot() async {
  var db = FirebaseFirestore.instance;

  try {
    var querySnapshot = await db.collection("patient").get();

    if (querySnapshot.docs.isNotEmpty) {
      var doc = querySnapshot.docs.first;
      print("${doc.id} => ${doc.data()}");
      return doc.data() as Map<String, dynamic>;
    } else {
      // Handle the case where no documents are found
      print("No documents found");
      return {"error": "No documents found"};
    }
  } catch (e) {
    // Handle any errors that occurred during the operation
    print("Error retrieving data: $e");
    return {"error": "Error retrieving data: $e"};
  }
}

Future<List<Map<String, dynamic>>> retrieveDataAll() async {
  var db = FirebaseFirestore.instance;

  try {
    var querySnapshot = await db.collection("patient").get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> data = [];
      querySnapshot.docs.forEach((doc) {
        data.add(doc.data());
      });
      return data;
    } else {
      // Handle the case where no documents are found
      print("No documents found");
      return [
        {"error": "No documents found"}
      ];
    }
  } catch (e) {
    // Handle any errors that occurred during the operation
    print("Error retrieving data: $e");
    return [
      {"error": "No documents found"}
    ];
  }
}
