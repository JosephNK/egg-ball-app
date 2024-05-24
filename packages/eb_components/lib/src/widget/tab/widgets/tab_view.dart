import 'package:flutter/material.dart';

class EBTabView extends StatelessWidget {
  final TabController? controller;
  final ScrollPhysics? physics;
  final bool disableScroll;
  final List<Widget> children;

  const EBTabView({
    super.key,
    required this.controller,
    this.physics,
    this.disableScroll = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final physics =
        disableScroll ? const NeverScrollableScrollPhysics() : this.physics;

    return TabBarView(
      controller: controller,
      physics: physics,
      children: children,
    );
  }
}
