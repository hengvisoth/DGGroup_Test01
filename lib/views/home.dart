import 'dart:async';

import 'package:dggroup_test/model/date_data_model.dart';
import 'package:dggroup_test/model/video_feed_item.dart';
import 'package:dggroup_test/services/video_feed_repository.dart';
import 'package:dggroup_test/utils/styles/app_color.dart';
import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:dggroup_test/views/widget/date_button.dart';
import 'package:dggroup_test/views/widget/item_card.dart';
import 'package:dggroup_test/views/widget/loading_item.dart';
import 'package:dggroup_test/views/widget/video_frame_thumbnail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VideoFeedRepository _repository = VideoFeedRepository();
  final ScrollController _scrollController = ScrollController();
  final Map<int, List<VideoFeedItem>> _pageCache = <int, List<VideoFeedItem>>{};
  final Set<int> _loadingPages = <int>{};
  final List<DateDataModel> _dateData = [
    DateDataModel(id: '1', dateNum: '09', dateTitle: 'T1'),
    DateDataModel(id: '2', dateNum: '10', dateTitle: 'T3'),
    DateDataModel(id: '3', dateNum: '11', dateTitle: 'T4'),
    DateDataModel(id: '4', dateNum: '12', dateTitle: 'T5'),
    DateDataModel(id: '5', dateNum: '13', dateTitle: 'T6'),
    DateDataModel(id: '6', dateNum: '14', dateTitle: 'T7'),
    DateDataModel(id: '7', dateNum: '15', dateTitle: 'CN'),
    DateDataModel(id: '8', dateNum: '16', dateTitle: 'T2'),
    DateDataModel(id: '9', dateNum: '17', dateTitle: 'T3'),
  ];

  bool _isInitialLoading = true;
  String? _initialError;
  double _itemExtent = 90;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    unawaited(_loadInitialPage());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialPage() async {
    await _loadPage(0);
    if (!mounted) {
      return;
    }

    setState(() {
      _isInitialLoading = false;
    });

    unawaited(_loadPage(1));
  }

  Future<void> _loadPage(int pageIndex) async {
    if (pageIndex < 0 || pageIndex >= _repository.pageCount) {
      return;
    }

    if (_pageCache.containsKey(pageIndex) || _loadingPages.contains(pageIndex)) {
      return;
    }

    _loadingPages.add(pageIndex);

    try {
      final items = await _repository.fetchPage(pageIndex);
      if (!mounted) {
        return;
      }
      setState(() {
        _pageCache[pageIndex] = items;
        if (pageIndex == 0) {
          _initialError = null;
        }
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (pageIndex == 0 && _pageCache.isEmpty) {
          _initialError = 'Failed to load list. Pull to refresh to retry.';
        }
      });
    } finally {
      _loadingPages.remove(pageIndex);
    }
  }

  VideoFeedItem? _itemAt(int index) {
    final pageIndex = index ~/ VideoFeedRepository.pageSize;
    final offsetInPage = index % VideoFeedRepository.pageSize;
    final page = _pageCache[pageIndex];

    if (page == null) {
      unawaited(_loadPage(pageIndex));
      return null;
    }

    if (offsetInPage >= page.length) {
      return null;
    }

    if (offsetInPage == page.length - 1) {
      unawaited(_loadPage(pageIndex + 1));
    }

    return page[offsetInPage];
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    if (_scrollController.position.extentAfter < _itemExtent * 12) {
      final estimatedLastVisibleIndex = ((_scrollController.offset + _scrollController.position.viewportDimension) / _itemExtent).floor();
      final nextPage = (estimatedLastVisibleIndex + VideoFeedRepository.pageSize) ~/ VideoFeedRepository.pageSize;
      unawaited(_loadPage(nextPage));
    }
  }

  Future<void> _onRefresh() async {
    setState(() {
      _pageCache.clear();
      _loadingPages.clear();
      _initialError = null;
      _isInitialLoading = true;
    });

    await _loadPage(0);
    if (!mounted) {
      return;
    }

    setState(() {
      _isInitialLoading = false;
    });

    unawaited(_loadPage(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          _itemExtent = constraints.maxHeight / 8;

          if (_initialError != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_initialError!, textAlign: TextAlign.center),
              ),
            );
          }

          return Column(
            children: [
              // Header
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Image.asset('assets/images/main_background.png', fit: BoxFit.cover, width: double.infinity, height: 100),
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
                          child: Text('LICH THI DAU', style: AppTextStyles.figmaBold16Capitalize.copyWith(color: AppColor.textOnPrimary)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(borderRadius: AppBorderRadius.md),
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
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(_dateData.length, (index) {
                                return Container(
                                  margin: EdgeInsets.only(right: index == _dateData.length - 1 ? 0 : 8, bottom: 8),
                                  child: DateButton(dateData: _dateData[index]),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // List Item
                        Expanded(
                          child: _isInitialLoading
                              ? const Center(child: CircularProgressIndicator())
                              : LayoutBuilder(
                                  builder: (context, listConstraints) {
                                    _itemExtent = listConstraints.maxHeight / 8;
                                    return RefreshIndicator(
                                      onRefresh: _onRefresh,
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        padding: EdgeInsets.zero,
                                        physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                                        itemExtent: _itemExtent,
                                        itemCount: VideoFeedRepository.totalItems,
                                        itemBuilder: (context, index) {
                                          final item = _itemAt(index);
                                          if (item == null) {
                                            return const LoadingItem();
                                          }
                                          return ItemCard(item: item);
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
