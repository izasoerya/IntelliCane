import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellicane/main_page/screen/home_page.dart';
import 'package:intellicane/maps_page/widget/maps_api.dart';

class MapsPage extends ConsumerWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.watch(selectedButton.notifier).state = 0; // Home Page
          },
        ),
      ),
      body: const MapsAPI(),
    );
  }
}
