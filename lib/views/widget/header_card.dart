import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.rowHeight});
  final double rowHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xFFE7BC68), Color(0xFFFFFFFF)]),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Image.asset("assets/images/marble.png", height: 54, width: 54, fit: BoxFit.contain),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: 1),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: AppColor.mainColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Marble Magic P8", style: AppTextStyles.figmaBold16Capitalize),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 8, bottom: 4, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                        border: Border(
                          top: BorderSide(width: 3, color: AppColor.borderColor),
                          left: BorderSide(width: 1, color: AppColor.borderColor),
                          right: BorderSide(width: 1, color: AppColor.borderColor),
                        ),
                      ),
                      child: Text("Hôm nay tháng 12", style: AppTextStyles.figmaBold10Uppercase),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
