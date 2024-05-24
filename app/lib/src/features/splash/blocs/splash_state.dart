import 'package:dart_object_extension/dart_object_extension.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

part 'splash_state.g.dart';

abstract class SplashState extends BlocBaseState {
  const SplashState({
    required super.exception,
  });
}

class SplashInitialState extends SplashState {
  const SplashInitialState({
    super.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}

class SplashLoadingState extends SplashState {
  const SplashLoadingState({
    super.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}

class SplashErrorState extends SplashState {
  final ErrorValue errorValue;

  const SplashErrorState({
    super.exception,
    required this.errorValue,
  });

  @override
  List<Object?> get props => [
        exception,
        errorValue,
      ];
}

@CopyWith()
class SplashLoadedState extends SplashState {
  final bool finish;
  final bool loading;

  const SplashLoadedState({
    super.exception,
    required this.finish,
    required this.loading,
  });

  @override
  List<Object?> get props => [
        exception,
        finish,
        loading,
      ];
}
