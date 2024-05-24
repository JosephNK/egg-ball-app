import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final double textScaleFactor;
  final int? maxLines;
  final LFTextSize? textSize;
  final double? height;

  const EBText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.left,
    this.color,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textScaleFactor = 1.0,
    this.textSize,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LFText(
      text,
      style: style,
      textAlign: textAlign,
      color: color,
      maxLines: maxLines,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      textSize: textSize,
      height: height,
    );
  }
}
