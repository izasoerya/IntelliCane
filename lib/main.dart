import 'package:flutter/material.dart';
import 'page_routing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: WidgetStateController(),
    ),
  );
}
