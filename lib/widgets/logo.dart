import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 170,
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const Image(image: AssetImage('assets/tag-logo.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    ));
  }
}
