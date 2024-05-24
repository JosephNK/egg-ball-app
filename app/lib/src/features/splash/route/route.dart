import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import '../blocs/splash_bloc.dart';
import '../ui/splash_screen.dart';

class EBSplashRoute {
  const EBSplashRoute();

  Widget rootToSplashScreen(
    BuildContext context, {
    VoidCallback? onCompleted,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashBloc()..add(SplashFetchEvent()),
        ),
      ],
      child: SplashScreen(onCompleted: onCompleted),
    );
  }
}
