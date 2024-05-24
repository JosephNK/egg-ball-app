import 'dart:async';

import 'package:eb_components/eb_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import '../../blocs/splash_bloc.dart';

mixin SplashWithBloc {
  Future<ResultValue<bool>> blocToFetchRefresh(
    BuildContext context, {
    bool isFirstLoad = false,
  }) async {
    final completer = Completer<ResultValue<bool>>();
    BlocProvider.of<SplashBloc>(context).add(
      SplashFetchEvent(completer: completer, isFirstLoad: isFirstLoad),
    );
    final result = await completer.future;
    if (context.mounted) {
      return result.showAlertIfExistErrorMessage(context);
    }
    return result;
  }

  Future<ResultValue<bool>> blocToFinish(BuildContext context) async {
    final completer = Completer<ResultValue<bool>>();
    BlocProvider.of<SplashBloc>(context).add(
      SplashFinishEvent(completer: completer),
    );
    final result = await completer.future;
    if (context.mounted) {
      return result.showAlertIfExistErrorMessage(context);
    }
    return result;
  }
}
