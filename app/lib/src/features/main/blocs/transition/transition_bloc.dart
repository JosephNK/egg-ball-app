library transition_blocs;

import 'dart:async';

import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

part 'transition_event.dart';
part 'transition_state.dart';

class TransitionBloc extends Bloc<TransitionEvent, TransitionState> {
  TransitionBloc() : super(TransitionInitialState()) {
    on<TransitionSplashEvent>(
      (event, emit) => _mapSplashToState(event, emit),
    );
    on<TransitionMainEvent>(
      (event, emit) => _mapMainToState(event, emit),
    );
    on<TransitionErrorEvent>(
      (event, emit) => _mapErrorToState(event, emit),
    );
  }

  final duration = const Duration(milliseconds: 100);

  Future<void> _mapSplashToState(
    TransitionSplashEvent event,
    Emitter<TransitionState> emit,
  ) async {
    emit(TransitionLoadingState());

    await Future.delayed(duration);

    emit(TransitionSplashState());
  }

  Future<void> _mapMainToState(
    TransitionMainEvent event,
    Emitter<TransitionState> emit,
  ) async {
    if (event.isFirstLoad) {
      emit(TransitionLoadingState());
      await Future.delayed(duration);
    }

    emit(TransitionMainState());
  }

  Future<void> _mapErrorToState(
    TransitionErrorEvent event,
    Emitter<TransitionState> emit,
  ) async {
    emit(TransitionLoadingState());
    await Future.delayed(duration);
    emit(TransitionErrorState());
  }
}
