import 'package:flutter/material.dart';
import 'package:intellicane/main_page/learn_more.dart';
import 'package:intellicane/main_page/profile_bar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              ]),
        ),
      ),
    );
  }
}
