import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBRichText extends StatelessWidget {
  final InlineSpan text;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final LFTextSize? textSize;

  const EBRichText({
    super.key,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return LFRichText(
      text: text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
