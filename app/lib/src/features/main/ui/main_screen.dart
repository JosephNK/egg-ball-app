import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class MainScreen extends ScreenStatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ScreenState<MainScreen>
    with WidgetsBindingObserver {
  @override
  bool get useSafeArea => false;

  @override
  Color? get backgroundColor => EBColors.baseWhite;

  @override
  bool? get resizeToAvoidBottomInset => false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
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
        debugPrint('[Main] AppLifecycleState.resumed');
        break;
      case AppLifecycleState.inactive:
        debugPrint('[Main] AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        debugPrint('[Main] AppLifecycleState.paused');
        break;
      case AppLifecycleState.detached:
        debugPrint('[Main] AppLifecycleState.detached');
        break;
      case AppLifecycleState.hidden:
        debugPrint('[Main] AppLifecycleState.hidden');
        break;
    }
  }

  @override
  Widget? buildScreen(BuildContext context) {
    return buildScaffold(context, null);
  }

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, Object? state) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context, Object? state) {
    return const Placeholder();
  }
}
