import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBListView<T> extends StatelessWidget {
  final Key? storageKey;
  final Widget Function(BuildContext context, T item, int index) builder;
  final List<T> items;
  final LFListViewController? controller;
  final LFScrollViewRefresh? onRefresh;
  final LFScrollViewLoadMore? onLoadMore;
  final LFScrollViewDidScroll? onDidScroll;
  final Widget? header;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool disallowGlow;
  final bool shrinkWrap;
  final bool scrollable;
  final bool hasReachedMax;

  const EBListView({
    super.key,
    this.storageKey,
    required this.builder,
    required this.items,
    required this.controller,
    this.onRefresh,
    this.onLoadMore,
    this.onDidScroll,
    this.header,
    this.padding = const EdgeInsets.all(0),
    this.physics,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.disallowGlow = false,
    this.scrollable = true,
    this.shrinkWrap = false,
    this.hasReachedMax = true,
  });

  @override
  Widget build(BuildContext context) {
    return LFListView(
      storageKey: storageKey,
      builder: builder,
      items: items,
      controller: controller,
      onRefresh: onRefresh,
      onLoadMore: onLoadMore,
      onDidScroll: onDidScroll,
      header: header,
      padding: padding,
      physics: physics,
      keyboardDismissBehavior: keyboardDismissBehavior,
      disallowGlow: disallowGlow,
      shrinkWrap: shrinkWrap,
      scrollable: scrollable,
      hasReachedMax: hasReachedMax,
    );
  }
}
