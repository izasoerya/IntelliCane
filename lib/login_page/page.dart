import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'package:intellicane/page_routing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              return const WidgetStateController();
            } else {
              return LoginScreen(
                controller: controller,
              );
            }
          },
        ),
      ),
    );
  }
}
