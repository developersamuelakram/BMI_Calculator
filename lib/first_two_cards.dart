import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstTwoCards extends StatelessWidget {
  FirstTwoCards(
      {required this.text, required this.iconData, required this.colour});

  final String text;
  final IconData iconData;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
            Icon(
              iconData,
              color: Colors.white,
              size: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
