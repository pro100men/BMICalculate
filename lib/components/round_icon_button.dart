import 'package:flutter/material.dart';

class RoundedBTN extends StatelessWidget {
  const RoundedBTN({
    super.key,
    required this.icon,
    required this.color,
    required this.onPress,
  });
  final IconData icon;
  final VoidCallback onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 5,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      shape: const CircleBorder(),
      fillColor: color,
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
