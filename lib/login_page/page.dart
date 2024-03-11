import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'package:intellicane/page_routing.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          controller: controller,
          itemBuilder: (context, index) {
            if (index == 0) {
              return LoginScreen(
                controller: controller,
              );
            } else if (index == 1) {
              return SingUpScreen(
                controller: controller,
              );
            } else if (index == 2) {
              return const MainPageApplication();
            } else {
              return LoginScreen(controller: controller);
            }
          },
        ),
      ),
    );
  }
}
