import 'package:flutter/material.dart';
import 'models/application_state.dart';

class WidgetStateController extends StatefulWidget {
  const WidgetStateController({Key? key}) : super(key: key);
  final WidgetBinder currentWidget = const WidgetBinder();

  @override
  State<WidgetStateController> createState() => _WidgetStateController();
}

class _WidgetStateController extends State<WidgetStateController> {
  late Widget screen;

  @override
  void initState() {
    super.initState();
    screen = widget.currentWidget.fetchStateWidget(ApplicationState.loginPage);
  }

  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
