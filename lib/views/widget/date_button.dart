import 'package:dggroup_test/model/date_data_model.dart';
import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  DateDataModel dateData;

  DateButton({super.key, required this.dateData});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Text(widget.dateData.dateTitle, style: isSelected ? null : const TextStyle(color: Colors.grey)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: isSelected ? AppColor.mainColor : LinearGradient(colors: [Colors.white, Colors.white]),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Text(widget.dateData.dateNum),
                Container(
                  height: 4,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: isSelected
                        ? LinearGradient(colors: [Colors.black, Colors.black])
                        : LinearGradient(colors: [Colors.white, Colors.white]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
