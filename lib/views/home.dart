import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int itemCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black, borderRadius: AppBorderRadius.md),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90,
                child: Stack(
                  children: [
                    Image.asset('assets/images/main_background.png', fit: BoxFit.cover, width: double.infinity, height: 90),

                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColor.mainColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                            border: Border.all(color: AppColor.borderColor, width: 4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 72),
                          child: Text("LICH THI DAU", style: AppTextStyles.figmaBold16Capitalize.copyWith(color: AppColor.textOnPrimary)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(color: AppColor.surface, borderRadius: AppBorderRadius.md),
                child: ClipRRect(
                  borderRadius: AppBorderRadius.md,
                  child: Column(
                    children: [
                      Container(
                        height: 12,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xFFF8E889), Color(0xFFE4B764)],
                          ),
                        ),
                      ),

                      ListView.builder(
                        itemCount: itemCount,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: AppColor.mainColor,
                              borderRadius: AppBorderRadius.sm,
                              border: Border.all(color: AppColor.borderColor, width: 4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'item ${index + 1}'.toUpperCase(),
                                  style: AppTextStyles.figmaBold10Uppercase.copyWith(color: AppColor.textOnPrimary),
                                ),
                                const SizedBox(height: 4),
                                Text('demo text'.toUpperCase(), style: AppTextStyles.figmaBold8Capitalize.copyWith(color: AppColor.textLight)),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
