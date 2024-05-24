import 'dart:async';

import 'package:eb_commons/eb_commons.dart';
import 'package:eb_components/eb_components.dart';
import 'package:eb_resource/eb_resource.dart';
import 'package:eggball/src/controllers/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit.dart';

import 'src/app.dart';
import 'src/features/main/blocs/transition/transition_bloc.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemService.ensureInitialized();

    await EasyLocalization.ensureInitialized();

    await Env.shared.ensureInitialized();

    await AppController.shared.register();

    Bloc.observer = LFBlocObserver();

    // FlutterError.onError ( to catch all unhandled-flutter-framework-errors )
    FlutterError.onError = (FlutterErrorDetails details) {
      Logging.e(':: Interceptor FlutterError onError: $details');
      FlutterError.dumpErrorToConsole(details);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      Logging.e(':: Interceptor Platform Error: $error');
      return true;
    };

    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: kAssetLangPath,
        fallbackLocale: const Locale('en', 'US'),
        child: const EggBallApp(),
      ),
    );
  }, (error, stackTrace) {
    // Zone ( to catch all unhandled-asynchronous-errors )
    Logging.e(':: Interceptor Zone Error : $error, StackTrace : $stackTrace');
  });
}

class EggBallApp extends StatelessWidget {
  const EggBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LFLocalizations Config
    LFLocalizations.shared.config(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TransitionBloc()..add(TransitionSplashEvent()),
        ),
      ],
      child: BlocBuilder<TransitionBloc, TransitionState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'EggBall App',
            navigatorKey: AppController.shared.navigationKey,
            localizationsDelegates: [
              // const CupertinoLocalizationsKoFixedDelegate(),
              ...context.localizationDelegates,
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // navigatorObservers: [
            //   FirebaseAnalyticsObserver(analytics: analytics),
            // ],
            theme: ThemeData(useMaterial3: false),
            builder: (context, widget) {
              ErrorWidget.builder = (errorDetails) {
                return EBRenderErrorView(
                  widget: widget,
                  errorDetails: errorDetails,
                );
              };
              if (widget != null) return widget;
              throw ('widget is null');
            },
            onGenerateRoute: (settings) {
              Logging.i('[onGenerateRoute]: $settings');
              final app = MaterialWithModalsPageRoute(
                builder: (_) => const App(),
                settings: settings,
              );
              switch (settings.name) {
                case '/':
                  return app;
              }
              return app;
            },
            onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (context) => EBUndefinedView(
                name: settings.name ?? '',
              ),
            ),
            initialRoute: '/',
            // home: App(env: env),
          );
        },
      ),
    );
  }
}
