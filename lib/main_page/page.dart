import 'package:flutter/material.dart';
import 'package:intellicane/main_page/connected_cane.dart';
import 'package:intellicane/main_page/learn_more.dart';
import 'package:intellicane/main_page/profile_bar.dart';
import 'package:intellicane/main_page/add_cane_id/add_cane_id.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
        Container(
          alignment: Alignment.topLeft,
          child: const RegisterCaneID(),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: const LearnMoreBar(),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: const ConnectedCane(),
        )
      ]),
    );
  }
}
