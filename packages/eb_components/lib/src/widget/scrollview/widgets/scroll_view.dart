import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBScrollView extends StatelessWidget {
  final Key? storageKey;
  final Widget child;
  final bool autoKeyboardHide;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final bool disallowGlow;
  final bool shrinkWrap; // Only Use LFScrollViewCupertino
  final bool scrollable;
  final bool enableTapUnFocus;
  final LFScrollViewController? controller;
  final LFScrollViewRefresh? onRefresh;
  final LFScrollViewDidScroll? onDidScroll;

  const EBScrollView({
    super.key,
    this.storageKey,
    required this.child,
    this.controller,
    this.autoKeyboardHide = false,
    this.physics,
    this.padding,
    this.disallowGlow = false,
    this.shrinkWrap = false,
    this.scrollable = true,
    this.enableTapUnFocus = false,
    this.onRefresh,
    this.onDidScroll,
  });

  @override
  Widget build(BuildContext context) {
    return LFScrollView(
      storageKey: storageKey,
      controller: controller,
      autoKeyboardHide: autoKeyboardHide,
      padding: padding,
      physics: physics,
      disallowGlow: disallowGlow,
      shrinkWrap: shrinkWrap,
      scrollable: scrollable,
      enableTapUnFocus: enableTapUnFocus,
      onRefresh: onRefresh,
      onDidScroll: onDidScroll,
      child: child,
    );
  }
}
