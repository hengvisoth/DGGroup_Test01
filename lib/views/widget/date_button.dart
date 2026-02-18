import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  String dateTitle;
  String dateNum;
  DateButton({super.key, required this.dateNum, required this.dateTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dateTitle),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: []),
          child: Text(dateNum),
        ),
      ],
    );
  }
}
