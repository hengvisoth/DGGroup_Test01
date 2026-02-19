import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  static const double _chipHeight = 34;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 4,
          children: [
            Container(
              height: _chipHeight,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                spacing: 10,
                children: [
                  Image.asset('assets/images/live_image.png', width: 49, height: 22),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white, width: 2),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFF6761), Color(0xFFFF1D1D)],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    child: const Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _chipHeight,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(gradient: AppColor.mainColor, borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Giải đấu'.toUpperCase(), style: AppTextStyles.figmaBold14Capitalize),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Image.asset('assets/images/champion.png', height: 30),
                  ),
                ],
              ),
            ),
            Container(
              height: _chipHeight,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('thời gian'.toUpperCase(), style: AppTextStyles.figmaBold14Capitalize),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Image.asset('assets/images/clock.png', height: 30),
                  ),
                ],
              ),
            ),
            Container(
              height: _chipHeight,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: [
                  BoxShadow(offset: const Offset(0, 5), blurRadius: 11, color: Colors.black.withValues(alpha: 0.10)),
                  BoxShadow(offset: const Offset(0, 20), blurRadius: 20, color: Colors.black.withValues(alpha: 0.09)),
                  BoxShadow(offset: const Offset(0, 45), blurRadius: 27, color: Colors.black.withValues(alpha: 0.05)),
                  BoxShadow(offset: const Offset(0, 79), blurRadius: 32, color: Colors.black.withValues(alpha: 0.03)),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFFFFF), Color(0xFFF7F7F7)],
                  ),
                  boxShadow: [BoxShadow(offset: const Offset(0, 2), blurRadius: 8, color: Colors.black.withValues(alpha: 0.10))],
                ),
                child: const Center(child: Icon(Icons.search, size: 30, color: Color(0xFF2B2B2B))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
