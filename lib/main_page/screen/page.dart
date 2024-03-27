import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellicane/main_page/screen/learn_more.dart';
import 'package:intellicane/main_page/screen/profile_bar.dart';

var selectedButton = StateProvider<int>((ref) => 0);

class MainHomePage extends ConsumerWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 30,
              width: 400,
              decoration: BoxDecoration(color: Colors.blue, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const ProfileBar(),
            const LearnMoreBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            ref.read(selectedButton.notifier).state = 0;
          } else if (index == 1) {
            ref.read(selectedButton.notifier).state = 1;
          } else if (index == 2) {
            ref.read(selectedButton.notifier).state = 2;
          }
        },
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        ],
      ),
    );
  }
}
