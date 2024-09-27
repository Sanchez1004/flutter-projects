import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        const SizedBox(height: 5,),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
              subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),),
        )
      ],
    );
  }
}