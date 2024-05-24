import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';

import '../../text/text.dart';

class EBUndefinedView extends StatelessWidget {
  final String name;

  const EBUndefinedView({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EBColors.baseBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EBText(
            'Undefined Page :: $name',
            style: EBTextStyles.headlineBlack,
          ),
        ],
      ),
    );
  }
}
