import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import '../../text/text.dart';

class EBErrorView extends StatefulWidget {
  final ErrorValue? errorValue;
  final VoidCallback? onPressed;

  const EBErrorView({
    super.key,
    required this.errorValue,
    this.onPressed,
  });

  @override
  State<EBErrorView> createState() => _EBErrorViewState();
}

class _EBErrorViewState extends State<EBErrorView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // final errorValue = widget.errorValue;
      // final statusCode = errorValue?.statusCode ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? title, message;
    final errorValue = widget.errorValue;
    if (errorValue != null) {
      title = 'ErrorMessage';
      final displayErrorMessage = errorValue.displayErrorMessage;
      final exception = errorValue.exception;
      message = displayErrorMessage;
      if (exception != null) {
        title += ' with Exception';
        message += '\n${exception.toString()}';
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EBText(
            title ?? '',
            style: EBTextStyles.p600TextBase,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          EBText(
            message ?? '',
            style: EBTextStyles.p400TextSM1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              widget.onPressed?.call();
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: const EBText('Refresh'),
          ),
        ],
      ),
    );
  }
}
