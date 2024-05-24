import 'package:dart_object_extension/dart_object_extension.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

part 'home_main_state.g.dart';

abstract class HomeMainState extends BlocBaseState {
  const HomeMainState({
    required super.exception,
  });
}

class HomeMainInitialState extends HomeMainState {
  const HomeMainInitialState({
    super.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}

class HomeMainLoadingState extends HomeMainState {
  const HomeMainLoadingState({
    super.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}

class HomeMainErrorState extends HomeMainState {
  final ErrorValue errorValue;

  const HomeMainErrorState({
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
class HomeMainLoadedState extends HomeMainState {
  const HomeMainLoadedState({
    super.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}
