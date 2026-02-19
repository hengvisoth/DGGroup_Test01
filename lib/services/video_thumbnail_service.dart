import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailService {
  VideoThumbnailService._();

  static final VideoThumbnailService instance = VideoThumbnailService._();

  final BaseCacheManager _cacheManager = DefaultCacheManager();
  final Map<String, Future<String?>> _inFlight = <String, Future<String?>>{};

  Future<String?> getThumbnailPath({
    required String videoUrl,
    required int frameMs,
  }) {
    final cacheKey = 'thumb_${videoUrl.hashCode}_$frameMs';
    return _inFlight.putIfAbsent(cacheKey, () async {
      try {
        final cachedThumb = await _cacheManager.getFileFromCache(cacheKey);
        if (cachedThumb != null && await cachedThumb.file.exists()) {
          return cachedThumb.file.path;
        }

        final cachedVideo = await _cacheManager.getSingleFile(
          videoUrl,
          key: 'video_$videoUrl',
        );

        final bytes = await VideoThumbnail.thumbnailData(
          video: cachedVideo.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 320,
          quality: 70,
          timeMs: frameMs,
        );

        if (bytes == null) {
          return null;
        }

        await _cacheManager.putFile(
          cacheKey,
          bytes,
          fileExtension: 'jpg',
          maxAge: const Duration(days: 30),
        );

        final savedThumb = await _cacheManager.getFileFromCache(cacheKey);
        return savedThumb?.file.path;
      } catch (_) {
        return null;
      } finally {
        _inFlight.remove(cacheKey);
      }
    });
  }
}
