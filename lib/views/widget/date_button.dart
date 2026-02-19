import 'package:dggroup_test/model/date_data_model.dart';
import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  final DateDataModel dateData;

  const DateButton({super.key, required this.dateData});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Text(widget.dateData.dateTitle, style: isSelected ? null : const TextStyle(color: Colors.grey)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: isSelected ? AppColor.mainColor : const LinearGradient(colors: [Colors.white, Colors.white]),
              boxShadow: const [
                BoxShadow(color: Color(0x26000000), offset: Offset(2, 4), blurRadius: 7.4, blurStyle: BlurStyle.inner),
                BoxShadow(color: Color(0x26000000), offset: Offset(0, 4), blurRadius: 26.4, blurStyle: BlurStyle.inner),
                BoxShadow(color: Color(0x0D000000), offset: Offset(0, 4), blurRadius: 26.7, blurStyle: BlurStyle.inner),
              ],
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
