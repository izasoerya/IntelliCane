import 'package:flutter/material.dart';
import 'package:intellicane/database/monitoring_db.dart';
import 'package:intellicane/main_page/add_cane_id/add_cane_id.dart';
import 'patient_bar.dart';

class ConnectedCane extends StatefulWidget {
  const ConnectedCane({super.key});

  @override
  State<ConnectedCane> createState() => _ConnectedCaneState();
}

class _ConnectedCaneState extends State<ConnectedCane> {
  Future<bool> fetchPatientRegistered() async {
    var documents = await retrieveDataSnapshot();
    print(documents);
    if (documents.containsKey('error') &&
        documents['error'] == 'No documents found') {
      return false; // Return false when there are no documents
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterCaneID(countPatient: fetchPatientRegistered),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.people),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      "Tunanetra yang terhubung"),
                ],
              ),
              FutureBuilder<bool>(
                future: fetchPatientRegistered(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show a loading spinner while waiting
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == false) {
                    return const NotYetRegistered();
                  } else {
                    return const AlreadyRegistered();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotYetRegistered extends StatelessWidget {
  const NotYetRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 20),
      child: const Column(
        children: [
          Image(
            image: AssetImage('assets/vector-tunanetra.png'),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
              style: TextStyle(
                fontSize: 16,
              ),
              "Anda belum terhubung ke orang tunanetra"),
        ],
      ),
    );
  }
}

class AlreadyRegistered extends StatefulWidget {
  const AlreadyRegistered({super.key});

  @override
  State<AlreadyRegistered> createState() => _AlreadyRegisteredState();
}

class _AlreadyRegisteredState extends State<AlreadyRegistered> {
  List<Map<String, dynamic>> ids = []; // This will hold your IDs

  @override
  void initState() {
    super.initState();
    fetchIds(); // Fetch the IDs when the widget is initialized
  }

  Future<void> fetchIds() async {
    // Fetch the IDs from your database and assign them to `ids`
    // This is just a placeholder, replace it with your actual database fetching code
    ids.addAll(await retrieveDataAll());
    RegisterCaneID(
      countPatient: fetchIds,
    );

    setState(() {}); // Call setState to rebuild the widget with the new data
  }

  @override
  Widget build(BuildContext context) {
    return PatientBar(data: ids);
  }
}
