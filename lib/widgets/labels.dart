import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({
    super.key,
    required this.onNavigate,
    required this.navigateText,
    required this.introText,
  });

  final Function onNavigate;
  final String introText;
  final String navigateText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          introText,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () => onNavigate(),
          child: Text(
            navigateText,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
