import 'package:eb_components/eb_components.dart';
import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

import '../blocs/splash_bloc.dart';
import 'blocs/splash_with_bloc.dart';
import 'views/splash_view.dart';

class SplashScreen extends ScreenStatefulWidget {
  final VoidCallback? onCompleted;

  const SplashScreen({
    super.key,
    super.index,
    this.onCompleted,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ScreenState<SplashScreen> with SplashWithBloc {
  @override
  bool get useSafeArea => false;

  @override
  Color? get backgroundColor => EBColors.baseWhite;

  @override
  Widget? buildScreen(BuildContext context) {
    return EBBlocScreenConsumer<SplashBloc, SplashState>(
      builder: (context, state) {
        return buildScaffold(context, state);
      },
      successListener: (context, state) async {
        if (state is SplashLoadedState) {
          final finish = state.finish;
          final loading = state.loading;

          if (finish && !loading) {
            widget.onCompleted?.call();
          }
        }
      },
      errorListener: (context, exception) {},
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, Object? state) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context, Object? state) {
    if (state is SplashErrorState) {
      return EBErrorView(
        errorValue: state.errorValue,
        onPressed: () async {
          await blocToFetchRefresh(context, isFirstLoad: true);
        },
      );
    }
    return const SplashView();
  }
}
