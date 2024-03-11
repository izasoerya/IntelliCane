import 'package:flutter/material.dart';
import 'login_page/page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MainView(),
    ),
  );
}
