import 'dart:math';

import 'package:dggroup_test/model/video_feed_item.dart';

class VideoFeedRepository {
  static const int totalItems = 5000000;
  static const int pageSize = 120;

  final List<String> _videoUrls = const [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  ];

  int get pageCount => (totalItems / pageSize).ceil();

  Future<List<VideoFeedItem>> fetchPage(int pageIndex) async {
    final start = pageIndex * pageSize;
    if (start >= totalItems) {
      return const <VideoFeedItem>[];
    }

    final end = min(start + pageSize, totalItems);
    return List<VideoFeedItem>.generate(end - start, (offset) {
      final id = start + offset;
      final videoUrl = _videoUrls[id % _videoUrls.length];
      final random = Random(id * 31 + 7);
      final frameMs = 1000 + random.nextInt(22000);

      return VideoFeedItem(id: id, videoUrl: videoUrl, frameMs: frameMs, status: (id % 3) + 1);
    }, growable: false);
  }
}
