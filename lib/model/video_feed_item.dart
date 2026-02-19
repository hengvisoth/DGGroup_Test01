class VideoFeedItem {
  const VideoFeedItem({required this.id, required this.videoUrl, required this.frameMs, required this.status});

  final int id;
  final String videoUrl;
  final int frameMs;

  // status 1 = live , 2 = notif on , 3 =notif off
  final int status;

  String get title => 'Item #${id + 1}';
  String get subtitle => 'Frame: ${frameMs}ms';
}
