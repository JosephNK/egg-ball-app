import 'package:eb_commons/eb_commons.dart';
import 'package:eb_components/eb_components.dart';
import 'package:eb_resource/eb_resource.dart';
import 'package:eggball/src/features/main/blocs/transition/transition_bloc.dart';
import 'package:eggball/src/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_manager.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_network.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import 'controllers/controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {});

    // BlocObserver event connect
    final blocObserver = Bloc.observer;
    if (blocObserver is LFBlocObserver) {
      blocObserver.onErrorCallback =
          (BlocBase bloc, Object error, StackTrace stackTrace) async {
        if (error is UnauthorisedException) {
          Logging.e('UnauthorisedException Error :: Please log out!');
          return;
        }
      };
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint('[App] AppLifecycleState.resumed');
        break;
      case AppLifecycleState.inactive:
        debugPrint('[App] AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        debugPrint('[App] AppLifecycleState.paused');
        break;
      case AppLifecycleState.detached:
        debugPrint('[App] AppLifecycleState.detached');
        break;
      case AppLifecycleState.hidden:
        debugPrint('[App] AppLifecycleState.hidden');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LFLayoutApp(
      configure: AppComponentConfigure(),
      backgroundColor: EBColors.baseWhite,
      buildName: Env.shared.buildName,
      onSetupDevice: (onBuilder) {
        LFDeviceManager.shared.setupAsync(context, androidId: null).then((_) {
          onBuilder.call();
        });
      },
      onBuilder: () async {},
      child: EBBlocScreenConsumer<TransitionBloc, TransitionState>(
        builder: (context, state) {
          if (state is TransitionSplashState) {
            return EBRoute.splash.rootToSplashScreen(
              context,
              onCompleted: () async {
                AppController.shared.transitionController
                    .transitionMainProcess(context);
              },
            );
          }
          if (state is TransitionMainState) {
            return EBRoute.main.rootToMainScreen(context);
          }
          if (state is TransitionErrorState) {
            return Container();
          }
          return Container();
        },
        successListener: (context, state) {},
        errorListener: (context, exception) {},
      ),
    );
  }
}
