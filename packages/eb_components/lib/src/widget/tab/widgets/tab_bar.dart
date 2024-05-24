import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';

enum EBTabBarType {
  primary,
  black,
}

class EBTabBar extends StatelessWidget {
  final TabController? controller;
  final BoxDecoration? decoration;
  final EdgeInsets padding;
  final bool isScrollable;
  final EBTabBarType type;
  final List<Tab> tabs;

  const EBTabBar({
    super.key,
    required this.controller,
    this.decoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.isScrollable = true,
    this.type = EBTabBarType.primary,
    this.tabs = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              controller: controller,
              labelColor: (type == EBTabBarType.primary)
                  ? EBColors.primary500
                  : EBColors.gray900,
              unselectedLabelColor: EBColors.gray700,
              indicatorColor: (type == EBTabBarType.primary)
                  ? EBColors.primary500
                  : EBColors.gray900,
              labelStyle: (type == EBTabBarType.primary)
                  ? EBTextStyles.p500TextSM1
                  : EBTextStyles.p500TextBase,
              unselectedLabelStyle: (type == EBTabBarType.primary)
                  ? EBTextStyles.p400TextSM1
                  : EBTextStyles.p500TextBase,
              // indicatorPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              indicatorSize: TabBarIndicatorSize.label,
              // tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              isScrollable: isScrollable,
              overlayColor: WidgetStateProperty.resolveWith(
                  (states) => Colors.transparent),
              tabs: tabs,
            ),
          ),
        ],
      ),
    );
  }
}
