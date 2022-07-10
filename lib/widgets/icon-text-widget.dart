import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const IconTextWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
