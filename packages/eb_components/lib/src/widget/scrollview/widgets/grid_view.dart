import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBGridView<T> extends StatelessWidget {
  final Key? storageKey;
  final Widget Function(BuildContext context, T item, int index) builder;
  final List<T> items;
  final LFGridViewController? controller;
  final LFScrollViewRefresh? onRefresh;
  final LFScrollViewLoadMore? onLoadMore;
  final LFScrollViewDidScroll? onDidScroll;
  final SliverGridDelegate? gridDelegate;
  final Widget? header;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool disallowGlow;
  final bool shrinkWrap;
  final bool scrollable;
  final bool hasReachedMax;

  const EBGridView({
    super.key,
    this.storageKey,
    required this.builder,
    required this.items,
    required this.controller,
    this.onRefresh,
    this.onLoadMore,
    this.onDidScroll,
    this.gridDelegate,
    this.header,
    this.padding = const EdgeInsets.all(0),
    this.physics,
    this.disallowGlow = false,
    this.shrinkWrap = false,
    this.scrollable = true,
    this.hasReachedMax = true,
  });

  @override
  Widget build(BuildContext context) {
    return LFGridView(
      storageKey: storageKey,
      builder: builder,
      items: items,
      controller: controller,
      onRefresh: onRefresh,
      onLoadMore: onLoadMore,
      gridDelegate: gridDelegate,
      header: header,
      padding: padding,
      physics: physics,
      disallowGlow: disallowGlow,
      shrinkWrap: shrinkWrap,
      scrollable: scrollable,
      hasReachedMax: hasReachedMax,
    );
  }
}
