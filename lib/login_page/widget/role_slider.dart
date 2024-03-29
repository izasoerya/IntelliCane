import 'package:flutter/material.dart';
import 'package:intellicane/login_page/global_properties.dart';

const List<Widget> role = <Widget>[
  Text('Patient'),
  Text('Guardian'),
];

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.hookRole});
  final void Function(String role) hookRole;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _role = <bool>[true, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _role.length; i++) {
                _role[i] = i == index;
              }
              _role[0] == true
                  ? widget.hookRole("Patient")
                  : widget.hookRole("Guardian");
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: primaryColor,
          selectedColor: Colors.white,
          fillColor: primaryColor,
          color: primaryColor,
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          isSelected: _role,
          children: role,
        ),
      ],
    );
  }
}
