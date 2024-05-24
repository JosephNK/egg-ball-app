part of '../controller.dart';

abstract class BaseTransition {
  Future<bool> transitionSignInProcess(BuildContext context);
  Future<void> transitionMainProcess(BuildContext context);
}

class TransitionController implements BaseTransition {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  @override
  Future<bool> transitionSignInProcess(BuildContext context) async {
    _transitionSignInScreen(context);
    return true;
  }

  @override
  Future<void> transitionMainProcess(
    BuildContext context, {
    bool isFirstLoad = true,
  }) async {
    _transitionMainScreen(context, isFirstLoad: isFirstLoad);
  }
}

extension TransitionControllerToScreen on TransitionController {
  Future<void> popRootScreen(BuildContext context) async {
    LFNavigation.popRoot(context);
    await Future.delayed(const Duration(milliseconds: 75));
  }

  void _transitionSignInScreen(BuildContext context) {
    BlocProvider.of<TransitionBloc>(context).add(
      TransitionSignInEvent(),
    );
  }

  void _transitionMainScreen(
    BuildContext context, {
    bool isFirstLoad = true,
  }) {
    BlocProvider.of<TransitionBloc>(context).add(
      TransitionMainEvent(isFirstLoad: isFirstLoad),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class SZLockOverlay {
  SZLockOverlay();

  OverlayEntry? _lockOverlayEntry;

  void showOverLay(BuildContext context) async {
    if (_lockOverlayEntry != null) return;

    _lockOverlayEntry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.transparent,
      );
    });

    Overlay.of(context).insert(_lockOverlayEntry!);
  }

  void closeOverlay() {
    _lockOverlayEntry?.remove();
    _lockOverlayEntry = null;
  }
}
