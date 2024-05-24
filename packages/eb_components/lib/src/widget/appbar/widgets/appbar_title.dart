import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';

import '../../text/text.dart';

class EBAppBarTitle extends StatelessWidget {
  final String text;

  const EBAppBarTitle(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EBText(
      text,
      style: EBTextStyles.p500TextBase,
    );
  }
}
