import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellicane/login_page/screens/login_screen.dart';
import 'models/application_state.dart';

class WidgetStateController extends ConsumerStatefulWidget {
  const WidgetStateController({Key? key}) : super(key: key);
  final WidgetBinder currentWidget = const WidgetBinder();

  @override
  ConsumerState<WidgetStateController> createState() =>
      _WidgetStateController();
}

class _WidgetStateController extends ConsumerState<WidgetStateController> {
  late Widget screen;

  @override
  void initState() {
    super.initState();
    // Start with the login page
    screen = widget.currentWidget.fetchStateWidget(ApplicationState.loginPage);
  }

  @override
  Widget build(BuildContext context) {
    final successAuthCondition = ref.watch(finishLoginProvider);
    screen = successAuthCondition
        ? widget.currentWidget.fetchStateWidget(ApplicationState.mapsPage)
        : screen;
    return screen;
  }
}
