import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

class EBBlocScreenConsumer<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;
  final BlocScreenSuccessListener<S> successListener;
  final BlocScreenErrorListener<S>? errorListener;

  const EBBlocScreenConsumer({
    super.key,
    required this.builder,
    required this.successListener,
    required this.errorListener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocScreenConsumer<B, S>(
      builder: builder,
      successListener: successListener,
      errorListener: (context, exception) {
        // Description ::
        // BlocBaseState 에 exception 값이 null 이 아닐 경우, Alert 표시
        LFAlertDialog.showException(
          context,
          exception: exception,
        );
        errorListener?.call(context, exception);
      },
    );
  }
}
