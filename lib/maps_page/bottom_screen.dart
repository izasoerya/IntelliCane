import 'package:flutter/material.dart';
import 'package:intellicane/maps_page/generate_icon.dart';

class DraggableBottomScreen extends StatefulWidget {
  const DraggableBottomScreen({super.key});

  @override
  State<DraggableBottomScreen> createState() => _DraggableBottomScreenState();
}

class _DraggableBottomScreenState extends State<DraggableBottomScreen> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    fetchIds();
    return DraggableScrollableSheet(
        key: _sheet,
        initialChildSize: 0.2,
        maxChildSize: 0.8,
        minChildSize: 0.1,
        expand: true,
        snap: true,
        snapSizes: const [0.3, 0.5, 0.7],
        controller: _controller,
        snapAnimationDuration: const Duration(milliseconds: 100),
        builder: (context, scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const SliverToBoxAdapter(
                    child: Icon(
                      Icons.drag_handle,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        GeneratorIcon(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
