import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_navigation.dart';

import 'appbar_back_button.dart';

class EBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final double? titleSpacing;
  final List<Widget> actions;
  final double? actionsRightMargin;
  final double? toolbarHeight;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  const EBAppBar({
    super.key,
    this.leading,
    this.leadingWidth,
    this.title,
    this.titleSpacing,
    this.actions = const [],
    this.actionsRightMargin,
    this.toolbarHeight,
    this.centerTitle,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    final leadingWidget = (leading != null)
        ? leading
        : canPop
            ? EBAppBarBackButton(onTap: () => LFNavigation.pop(context))
            : null;

    return LFAppBar(
      leading: leadingWidget,
      leadingWidth: (leading != null) ? leadingWidth : null,
      title: title,
      titleSpacing: titleSpacing,
      centerTitle: centerTitle,
      bottomBorderColor: EBColors.gray200,
      actions: actions,
      actionsRightMargin: actionsRightMargin,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ??
      kLFToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
