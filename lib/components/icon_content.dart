import 'package:flutter/material.dart';
import '../constants.dart';

class IconCard extends StatelessWidget {
  IconCard({required this.icon, required this.textCard});
  final IconData icon;
  final String textCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80,),
        SizedBox(
          height: 10,
        ),
        Text(textCard, style: kStyleText,)
      ],
    );
  }
}