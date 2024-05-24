import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';

import '../../text/text.dart';

class EBRenderErrorView extends StatelessWidget {
  final Widget? widget;
  final FlutterErrorDetails errorDetails;

  const EBRenderErrorView({
    super.key,
    required this.widget,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    bool isDebug = !kDebugMode;

    Widget body = Expanded(
      child: Container(
        color: EBColors.baseBlack,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EBText(
                  isDebug
                      ? errorDetails.summary.toString()
                      : 'L10N_COMMON_ERR_MESSAGE'.tr(),
                  style: EBTextStyles.headlineBlack,
                  textAlign: TextAlign.center,
                  color: EBColors.primary0,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget is Scaffold || widget is Navigator) {
      return Scaffold(body: body);
    }

    return body;
  }
}
