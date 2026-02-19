import 'dart:io';

import 'package:dggroup_test/services/video_thumbnail_service.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class VideoFrameThumbnail extends StatefulWidget {
  const VideoFrameThumbnail({super.key, required this.videoUrl, required this.frameMs});

  final String videoUrl;
  final int frameMs;

  @override
  State<VideoFrameThumbnail> createState() => _VideoFrameThumbnailState();
}

class _VideoFrameThumbnailState extends State<VideoFrameThumbnail> {
  late Future<String?> _thumbnailFuture;

  @override
  void initState() {
    super.initState();
    _thumbnailFuture = _loadThumbnail();
  }

  @override
  void didUpdateWidget(covariant VideoFrameThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl || oldWidget.frameMs != widget.frameMs) {
      _thumbnailFuture = _loadThumbnail();
    }
  }

  Future<String?> _loadThumbnail() {
    return VideoThumbnailService.instance.getThumbnailPath(videoUrl: widget.videoUrl, frameMs: widget.frameMs);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.lg,
      child: FutureBuilder<String?>(
        future: _thumbnailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: const Color(0xFFEEEEEE),
              child: const Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Container(color: const Color(0xFFEEEEEE), child: const Icon(Icons.broken_image_outlined));
          }

          return Image.file(File(snapshot.data!), fit: BoxFit.cover, filterQuality: FilterQuality.low);
        },
      ),
    );
  }
}
