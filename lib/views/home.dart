import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int itemCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DGGroup Test',
          style: AppTextStyles.figmaBold16Capitalize.copyWith(
            color: AppColor.textColor,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: AppBorderRadius.md,
        ),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                gradient: AppColor.mainColor,
                borderRadius: AppBorderRadius.sm,
                border: Border.all(color: AppColor.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'item ${index + 1}'.toUpperCase(),
                    style: AppTextStyles.figmaBold10Uppercase.copyWith(
                      color: AppColor.textOnPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'demo text'.toUpperCase(),
                    style: AppTextStyles.figmaBold8Capitalize.copyWith(
                      color: AppColor.textLight,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
