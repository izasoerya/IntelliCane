import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

class RoleSlider extends StatefulWidget {
  const RoleSlider({super.key, required this.determineUserRole});
  final void Function(String result) determineUserRole;

  @override
  State<RoleSlider> createState() => _RoleSliderState();
}

class _RoleSliderState extends State<RoleSlider> {
  String result = "Patient";
  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: MediaQuery.of(context).size.width,
      buttonWidth: 150,
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      buttonColor: Theme.of(context).primaryColor,
      dismissible: false,
      label: const Center(child: Text('|||')),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Patient',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text('Guardian',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onChanged: (position) {
        widget.determineUserRole(result);
        if (position == SlidableButtonPosition.end) {
          result = 'Patient';
        } else {
          result = 'Guardian';
        }
      },
    );
  }
}
