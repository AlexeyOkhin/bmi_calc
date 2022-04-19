import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, required this.onClick});

  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      //elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
      onPressed: onClick,
    );
  }
}
