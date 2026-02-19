import 'package:dggroup_test/model/video_feed_item.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:dggroup_test/views/widget/video_frame_thumbnail.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final VideoFeedItem item;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.lg,
          boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
        ),
        child: Row(
          spacing: 10,
          children: [
            // Time + Date Container Box
            Container(
              width: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F7),
                borderRadius: AppBorderRadius.lg,
                boxShadow: const [
                  BoxShadow(color: Color(0x26000000), offset: Offset(2, 4), blurRadius: 7.4, spreadRadius: 0, blurStyle: BlurStyle.inner),
                  BoxShadow(color: Color(0x26000000), offset: Offset(0, 4), blurRadius: 26.4, spreadRadius: 0, blurStyle: BlurStyle.inner),
                  BoxShadow(color: Color(0x0D000000), offset: Offset(0, 4), blurRadius: 26.7, spreadRadius: 0, blurStyle: BlurStyle.inner),
                ],
              ),
              child: const Text(
                '01:00\n13/09',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, height: 1.05, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),

            // Live
            item.status == 1
                ? Image.asset('assets/images/live_image.png', width: 56, height: 56)
                : item.status == 2
                ? Image.asset('assets/images/notif_on.png', width: 56, height: 56)
                : Image.asset('assets/images/notif_off.png', width: 56, height: 56),
            Expanded(
              child: SizedBox(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    VideoFrameThumbnail(videoUrl: item.videoUrl, frameMs: item.frameMs),
                    Positioned(
                      left: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(borderRadius: AppBorderRadius.lg, color: Colors.white),
                        child: Row(
                          spacing: 10,
                          children: [
                            Text('Núi lửa Hawaii', style: AppTextStyles.figmaBold10Uppercase),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(4))),
                              child: Text("03:59", style: AppTextStyles.figmaBold10Uppercase.copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
