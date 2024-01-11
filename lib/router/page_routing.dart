import 'package:flutter/material.dart';
import 'package:intellicane/maps_page/page.dart';
import 'package:intellicane/message_page/page.dart';
import 'package:intellicane/login_page/page.dart';

class MainPageApplication extends StatefulWidget {
  const MainPageApplication({Key? key}) : super(key: key);

  @override
  State<MainPageApplication> createState() => _MainPageApplicationState();
}

class _MainPageApplicationState extends State<MainPageApplication> {
  late Widget currentWidget;

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 4.0,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Achmad Taufiq'),
              accountEmail: Text('Guardian'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Maps'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPageMaps(
                              latitude: 0,
                              longitude: 0,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainView()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'IntelliCane',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 75, 160),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Text(
            "Welcome to IntelliCane",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
