import 'package:dggroup_test/model/date_data_model.dart';
import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:dggroup_test/views/widget/date_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final int itemCount = 100;
  final List<DateDataModel> dateData = [
    DateDataModel(id: "1", dateNum: "09", dateTitle: "T1"),
    DateDataModel(id: "2", dateNum: "10", dateTitle: "T3"),
    DateDataModel(id: "3", dateNum: "11", dateTitle: "T4"),
    DateDataModel(id: "4", dateNum: "12", dateTitle: 'T5'),
    DateDataModel(id: "5", dateNum: "13", dateTitle: 'T6'),
    DateDataModel(id: "6", dateNum: "14", dateTitle: 'T7'),
    DateDataModel(id: "7", dateNum: "15", dateTitle: 'CN'),
    DateDataModel(id: "8", dateNum: "16", dateTitle: 'T2'),
    DateDataModel(id: "9", dateNum: "16", dateTitle: 'T3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black, borderRadius: AppBorderRadius.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Image.asset('assets/images/main_background.png', fit: BoxFit.cover, width: double.infinity, height: 90),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppColor.mainColor,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                            border: Border.all(color: AppColor.borderColor, width: 4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          margin: const EdgeInsets.only(top: 32),
                          child: Text("LICH THI DAU", style: AppTextStyles.figmaBold16Capitalize.copyWith(color: AppColor.textOnPrimary)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content + list
              Container(
                alignment: Alignment.topCenter,
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
                      SizedBox(height: 12),
                      // Date Button
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = dateData[index];
                            return DateButton(dateData: data);
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                          itemCount: dateData.length,
                          shrinkWrap: true,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        color: Colors.black,
                        child: ListView.builder(
                          itemCount: itemCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => _ItemCard(index: index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final int index;
  const _ItemCard({required this.index});

  @override
  Widget build(BuildContext context) {
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
          Text('item ${index + 1}'.toUpperCase(), style: AppTextStyles.figmaBold10Uppercase.copyWith(color: AppColor.textOnPrimary)),
          const SizedBox(height: 4),
          Text('demo text'.toUpperCase(), style: AppTextStyles.figmaBold8Capitalize.copyWith(color: AppColor.textLight)),
        ],
      ),
    );
  }
}
