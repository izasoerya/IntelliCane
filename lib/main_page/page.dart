import 'package:flutter/material.dart';
import 'package:intellicane/main_page/learn_more.dart';
import 'package:intellicane/main_page/profile_bar.dart';
import 'package:intellicane/main_page/add_cane_id.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const ProfileBar(),
        Container(
          alignment: Alignment.topLeft,
          child: const RegisterCaneID(),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: const LearnMoreBar(),
        ),
      ]),
    );
  }
}
