import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

extension ResultValueExt<T> on ResultValue<T> {
  Future<ResultValue<T>> showAlertIfExistErrorMessage(
      BuildContext context) async {
    return showIfExistErrorMessage(context,
        onErrorMessage: (context, errorMessage) async {
      await LFAlertDialog.showErrorMessage(
        context,
        errorMessage: errorMessage,
      );
    });
  }
}
