import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const ColorItem({super.key, required this.isSelected, required this.color});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(backgroundColor: color, radius: 28))
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}
