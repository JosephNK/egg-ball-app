library app_controller;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit.dart';
import 'package:get_it/get_it.dart';

import '../features/main/blocs/transition/transition_bloc.dart';

part 'classes/file_controller.dart';
part 'classes/transition_controller.dart';

class AppController {
  static final AppController _instance = AppController._internal();

  static AppController get shared => _instance;

  AppController._internal();

  GlobalKey<NavigatorState> get navigationKey =>
      GetIt.I.get<TransitionController>().navigatorKey;

  BuildContext? get navigationContext =>
      GetIt.I.get<TransitionController>().context;

  Locale get locale => LFLocalizations.shared.locale;

  LFBottomTabBarScaffoldController scaffoldController =
      LFBottomTabBarScaffoldController();

  /// Get Controller

  FileController get fileController => GetIt.I.get<FileController>();

  TransitionController get transitionController =>
      GetIt.I.get<TransitionController>();

  /// Register

  Future<void> register() async {
    // GetIt Register Singleton
    GetIt.I.registerSingleton<FileController>(
      FileController(),
    );
    GetIt.I.registerSingleton<TransitionController>(
      TransitionController(),
    );
  }

  Future<dynamic> showReadyAlertDialog(BuildContext context) async {
    return await LFAlertDialog.show(context,
        message: 'L10N_COMMON_COMING_SOON_MESSAGE'.tr());
  }
}

extension AppControllerHelper on AppController {
  Future<void> waitShowAlertErrorValues(List<ErrorValue?> errorValues) async {
    await ResultValue.waitForShowErrorValues(
      navigationContext,
      errorValues,
      onErrorValue: (context, errorValue) async {
        final errorMessage = errorValue.displayErrorMessageWithErrorCode;
        await LFAlertDialog.showErrorMessage(context,
            errorMessage: errorMessage);
      },
      sync: false,
    );
  }
}
