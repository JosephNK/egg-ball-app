import 'package:eb_components/eb_components.dart';
import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import '../blocs/home_main_bloc.dart';
import 'blocs/home_main_with_bloc.dart';
import 'views/home_main_view.dart';

class HomeScreen extends ScreenStatefulWidget {
  const HomeScreen({
    super.key,
    super.index,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ScreenState<HomeScreen> with HomeMainWithBloc {
  @override
  Color? get backgroundColor => EBColors.baseWhite;

  @override
  SafeAreaInsets get safeAreaInsets =>
      SafeAreaInsets.fromLTRB(true, false, true, true);

  @override
  Widget? buildScreen(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeMainBloc()..add(HomeMainFetchEvent())),
      ],
      child: EBBlocScreenConsumer<HomeMainBloc, HomeMainState>(
        builder: (context, state) {
          return buildScaffold(context, state);
        },
        successListener: (context, state) {},
        errorListener: (context, exception) {},
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, Object? state) {
    return EBAppBar(
      title: EBAppBarTitle('L10N_APP_NAME'.tr()),
    );
  }

  @override
  Widget buildBody(BuildContext context, Object? state) {
    if (state is HomeMainLoadingState) {
      return const EBCenterIndicator();
    }

    if (state is HomeMainErrorState) {
      return EBErrorView(
        errorValue: state.errorValue,
        onPressed: () async {
          await blocToFetchRefresh(context, isFirstLoad: true);
        },
      );
    }

    if (state is HomeMainLoadedState) {
      return const HomeMainView();
    }

    return Container();
  }
}
